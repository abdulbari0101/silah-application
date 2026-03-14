import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/network/firestore_display_resolver.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_request_entity.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_status.dart';
import 'package:silah_app/features/consultations/domain/repositories/consultations_repository.dart';
import 'package:silah_app/features/consultations/presentation/support/consultation_close_reason_localizer.dart';
import 'package:silah_app/features/messaging/presentation/cubits/conversation/chat_conversation_cubit.dart';
import 'package:silah_app/features/messaging/presentation/views/conversation/models/chat_conversation_args.dart';
import 'package:silah_app/features/messaging/presentation/views/conversation/widgets/chat_conversation_body.dart';
import 'package:silah_app/features/messaging/presentation/views/conversation/widgets/chat_end_conversation_sheet.dart';

class ChatConversationScreen extends StatefulWidget {
  const ChatConversationScreen({super.key, required this.args});

  final ChatConversationArgs args;

  @override
  State<ChatConversationScreen> createState() => _ChatConversationScreenState();
}

class _ChatConversationScreenState extends State<ChatConversationScreen> {
  late final Future<String?> _titleFuture;
  late final ConsultationsRepository _consultationsRepository;
  late final Stream<ConsultationRequestEntity?>? _consultationStream;
  bool _isClosing = false;

  @override
  void initState() {
    super.initState();
    _consultationsRepository = locator<ConsultationsRepository>();
    _titleFuture = _resolveTitle();
    final consultationId = widget.args.thread.consultationId?.trim();
    _consultationStream = consultationId == null || consultationId.isEmpty
        ? null
        : _consultationsRepository.watchRequestById(consultationId);
  }

  Future<String?> _resolveTitle() async {
    final currentUid = FirebaseAuth.instance.currentUser?.uid;
    final participantIds =
        widget.args.thread.participantIds ?? const <String>[];
    final otherParticipantId = participantIds.firstWhere(
      (item) => item != currentUid,
      orElse: () => participantIds.isNotEmpty ? participantIds.first : '',
    );
    return FirestoreDisplayResolver.resolveUserName(otherParticipantId);
  }

  Future<void> _closeChat() async {
    final consultationId = widget.args.thread.consultationId?.trim();
    if (consultationId == null || consultationId.isEmpty || _isClosing) {
      return;
    }

    final closeReason = await showChatEndConversationSheet(context);

    if (closeReason == null || !mounted) {
      return;
    }

    setState(() {
      _isClosing = true;
    });

    final result = await _consultationsRepository.updateRequestStatus(
      consultationId,
      ConsultationStatus.closed,
      closeReason: closeReason,
    );

    if (!mounted) {
      return;
    }

    result.fold((failure) => Toasts.error(context, failure.message), (_) {
      context.pop();
    });

    if (mounted) {
      setState(() {
        _isClosing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final threadId = widget.args.thread.id;
    if (threadId == null || threadId.isEmpty) {
      return PlatformScreenWrapper(
        title: Strings.messages.tr(),
        body: Center(child: Text(Strings.unexpected_error.tr())),
      );
    }
    final authUser = context.select<AppStateBloc, AuthUserEntity?>(
      (bloc) => bloc.state.data.customer,
    );
    final accountType = authUser?.profile?['accountType']
        ?.toString()
        .toLowerCase();
    final canEndChat =
        (widget.args.thread.consultationId?.trim().isNotEmpty ?? false) &&
        (accountType == 'lawyer' ||
            authUser?.accountType == AuthAccountType.lawyer);

    return FutureBuilder<String?>(
      future: _titleFuture,
      builder: (context, snapshot) {
        final title = snapshot.data?.trim();

        return BlocProvider(
          create: (_) =>
              ChatConversationCubit(repository: locator(), threadId: threadId)
                ..load(),
          child: StreamBuilder<ConsultationRequestEntity?>(
            stream: _consultationStream,
            builder: (context, consultationSnapshot) {
              final isMessagingEnabled = _isMessagingEnabled(
                consultationSnapshot,
              );
              final messagingDisabledNotice = _resolveMessagingDisabledNotice(
                consultationSnapshot,
              );
              final actions = canEndChat && isMessagingEnabled
                  ? <Widget>[
                      PopupMenuButton<String>(
                        enabled: !_isClosing,
                        onSelected: (_) => _closeChat(),
                        itemBuilder: (context) => [
                          PopupMenuItem<String>(
                            value: 'end-chat',
                            child: Text(Strings.end_chat.tr()),
                          ),
                        ],
                        icon: const Icon(Icons.more_horiz_rounded),
                      ),
                    ]
                  : null;

              return PlatformScreenWrapper(
                title: title?.isNotEmpty == true
                    ? title!
                    : Strings.messages.tr(),
                androidActions: actions,
                iosTrailing: actions?.first,
                androidBackgroundColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerLow,
                iosBackgroundColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerLow,
                body: ChatConversationBody(
                  threadId: threadId,
                  isMessagingEnabled: isMessagingEnabled,
                  messagingDisabledNotice: messagingDisabledNotice,
                ),
              );
            },
          ),
        );
      },
    );
  }

  bool _isMessagingEnabled(
    AsyncSnapshot<ConsultationRequestEntity?> consultationSnapshot,
  ) {
    final consultationId = widget.args.thread.consultationId?.trim();
    if (consultationId == null || consultationId.isEmpty) {
      return true;
    }
    if (!consultationSnapshot.hasData &&
        (consultationSnapshot.connectionState == ConnectionState.waiting ||
            consultationSnapshot.connectionState == ConnectionState.none)) {
      return false;
    }

    return consultationSnapshot.data?.status.allowsMessaging ?? false;
  }

  String? _resolveMessagingDisabledNotice(
    AsyncSnapshot<ConsultationRequestEntity?> consultationSnapshot,
  ) {
    final consultationId = widget.args.thread.consultationId?.trim();
    if (consultationId == null || consultationId.isEmpty) {
      return null;
    }
    if (!consultationSnapshot.hasData &&
        (consultationSnapshot.connectionState == ConnectionState.waiting ||
            consultationSnapshot.connectionState == ConnectionState.none)) {
      return null;
    }

    final consultation = consultationSnapshot.data;
    if (consultation?.status.allowsMessaging == true) {
      return null;
    }

    final reason = consultation?.closeReason;
    if (consultation?.status == ConsultationStatus.closed && reason != null) {
      return '${Strings.consultation_messaging_unavailable_message.tr()}\n${ConsultationCloseReasonLocalizer.label(reason)}';
    }

    return Strings.consultation_messaging_unavailable_message.tr();
  }
}

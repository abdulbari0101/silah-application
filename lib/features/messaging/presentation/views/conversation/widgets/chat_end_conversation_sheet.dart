import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_close_reason.dart';
import 'package:silah_app/features/consultations/presentation/support/consultation_close_reason_localizer.dart';

Future<ConsultationCloseReason?> showChatEndConversationSheet(
  BuildContext context,
) {
  return Navigator.of(context).push<ConsultationCloseReason>(
    PageRouteBuilder<ConsultationCloseReason>(
      pageBuilder: (_, __, ___) => const _ChatEndConversationSheet(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation =
            Tween<Offset>(
              begin: const Offset(0, 0.08),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
    ),
  );
}

class _ChatEndConversationSheet extends StatefulWidget {
  const _ChatEndConversationSheet();

  @override
  State<_ChatEndConversationSheet> createState() =>
      _ChatEndConversationSheetState();
}

class _ChatEndConversationSheetState extends State<_ChatEndConversationSheet> {
  ConsultationCloseReason? _selectedReason;
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final reasons = ConsultationCloseReason.values;

    return Scaffold(
      backgroundColor: context.colors.surfaceContainerLow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: UIConstants.screenHorizantalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: IconButton(
                  onPressed: _isSubmitting ? null : () => context.pop(),
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: context.colors.primary,
                  ),
                ),
              ),
              const Spacer(flex: 2),
              Text(
                Strings.confirm_end_chat.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.headlineSmall?.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              UIConstants.xbigHeight,
              Text(
                Strings.end_chat_reason_label.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              UIConstants.mediumHeight,
              ...reasons.map(
                (reason) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: _CloseReasonTile(
                    label: ConsultationCloseReasonLocalizer.label(reason),
                    isSelected: _selectedReason == reason,
                    isBusy: _isSubmitting,
                    onTap: () => _handleReasonSelection(reason),
                  ),
                ),
              ),
              const Spacer(flex: 5),
              PrimaryButton(
                text: Strings.end_chat.tr(),
                style: FintureButtonStyle.danger,
                isDisabled: _selectedReason == null,
                isLoading: _isSubmitting,
                onTap: _handleConfirm,
              ),
              UIConstants.xbigHeight,
            ],
          ),
        ),
      ),
    );
  }

  void _handleReasonSelection(ConsultationCloseReason reason) {
    if (_isSubmitting) {
      return;
    }

    setState(() {
      _selectedReason = reason;
    });
  }

  Future<void> _handleConfirm() async {
    final reason = _selectedReason;
    if (_isSubmitting || reason == null) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    await Future<void>.delayed(const Duration(milliseconds: 140));

    if (!mounted) {
      return;
    }

    Navigator.of(context).pop(reason);
  }
}

class _CloseReasonTile extends StatelessWidget {
  const _CloseReasonTile({
    required this.label,
    required this.isSelected,
    required this.isBusy,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final bool isBusy;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final borderColor = isSelected
        ? context.colors.primary
        : context.colors.outlineVariant.withAlphaOpacity(0.4);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isBusy ? null : onTap,
        borderRadius: BorderRadius.circular(22),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: borderColor, width: isSelected ? 1.5 : 1),
            boxShadow: [
              BoxShadow(
                color: context.colors.shadow.withAlphaOpacity(0.05),
                blurRadius: 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 22),
              Expanded(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? context.colors.primary.withAlphaOpacity(0.12)
                      : context.colors.surface,
                  border: Border.all(
                    color: isSelected
                        ? context.colors.primary
                        : context.colors.outlineVariant,
                    width: 1.4,
                  ),
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.colors.primary,
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

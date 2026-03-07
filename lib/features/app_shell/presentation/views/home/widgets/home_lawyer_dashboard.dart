import 'package:dartz/dartz.dart' show Either;
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/infrastructure/network/firestore_display_resolver.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/extensions/app_setting_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_request_entity.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_status.dart';
import 'package:silah_app/features/consultations/domain/repositories/consultations_repository.dart';
import 'package:silah_app/features/consultations/presentation/views/details/models/consultation_request_details_args.dart';
import 'package:silah_app/features/training/domain/entities/training_application_status.dart';
import 'package:silah_app/features/training/domain/repositories/training_repository.dart';

class HomeLawyerDashboard extends StatefulWidget {
  const HomeLawyerDashboard({super.key});

  @override
  State<HomeLawyerDashboard> createState() => _HomeLawyerDashboardState();
}

class _HomeLawyerDashboardState extends State<HomeLawyerDashboard> {
  Future<_LawyerHomeSnapshot>? _future;
  String? _localeCode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final nextLocaleCode = context.locale.languageCode;
    if (_future == null || _localeCode != nextLocaleCode) {
      _localeCode = nextLocaleCode;
      _future = _loadSnapshot();
    }
  }

  Future<_LawyerHomeSnapshot> _loadSnapshot() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null || uid.trim().isEmpty) {
      throw StateError(Strings.unexpected_error.tr());
    }
    final localeCode = _localeCode ?? context.locale.languageCode;

    final consultationsRepository = locator<ConsultationsRepository>();
    final trainingRepository = locator<TrainingRepository>();

    final requests = _unwrap(await consultationsRepository.fetchMyRequests());
    final applications = _unwrap(
      await trainingRepository.fetchApplicationsForLawyer(uid),
    );

    final pendingConsultations = requests
        .where((item) => item.status == ConsultationStatus.pending)
        .length;
    final pendingTraining = applications
        .where((item) => item.status == TrainingApplicationStatus.pending)
        .length;

    final activeRequests =
        requests
            .where(
              (item) =>
                  item.status == ConsultationStatus.accepted ||
                  item.status == ConsultationStatus.active,
            )
            .toList()
          ..sort(
            (left, right) => _timestampOf(
              right.updatedAt ?? right.createdAt,
            ).compareTo(_timestampOf(left.updatedAt ?? left.createdAt)),
          );

    final preview = activeRequests.isNotEmpty ? activeRequests.first : null;
    final previewClientName = await _resolvePreviewUserName(preview?.clientId);
    final previewSpecializationName = await _resolvePreviewSpecializationName(
      preview?.specializationId,
      localeCode: localeCode,
    );

    return _LawyerHomeSnapshot(
      pendingConsultations: pendingConsultations,
      pendingTraining: pendingTraining,
      previewRequest: preview,
      previewClientName: previewClientName,
      previewSpecializationName: previewSpecializationName,
    );
  }

  Future<String?> _resolvePreviewUserName(String? userId) async {
    try {
      return await FirestoreDisplayResolver.resolveUserName(userId);
    } catch (_) {
      return null;
    }
  }

  Future<String?> _resolvePreviewSpecializationName(
    String? specializationId, {
    required String localeCode,
  }) async {
    try {
      return await FirestoreDisplayResolver.resolveSpecializationName(
        specializationId,
        localeCode: localeCode,
      );
    } catch (_) {
      return null;
    }
  }

  DateTime _timestampOf(String? value) {
    return DateTime.tryParse(value ?? '') ??
        DateTime.fromMillisecondsSinceEpoch(0);
  }

  T _unwrap<T>(Either<Failure, T> result) {
    return result.fold(
      (failure) => throw StateError(failure.message),
      (data) => data,
    );
  }

  void _retry() {
    setState(() {
      _future = _loadSnapshot();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<_LawyerHomeSnapshot>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: ProgressStateWidget());
        }
        if (snapshot.hasError || !snapshot.hasData) {
          return CustomeErrorWidget(
            message:
                snapshot.error?.toString() ?? Strings.unexpected_error.tr(),
            onRetry: _retry,
          );
        }

        final data = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              Strings.today_summary.tr(),
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            UIConstants.smallHeight,
            Row(
              children: [
                Expanded(
                  child: _MetricCard(
                    title: Strings.new_consultations.tr(),
                    count: data.pendingConsultations,
                    onTap: () => context.pushNamed(AppRoutes.requests.name),
                  ),
                ),
                UIConstants.mediumWidth,
                Expanded(
                  child: _MetricCard(
                    title: Strings.training_requests.tr(),
                    count: data.pendingTraining,
                    onTap: () => context.pushNamed(AppRoutes.trainees.name),
                  ),
                ),
              ],
            ),
            UIConstants.xbigHeight,
            Row(
              children: [
                Expanded(
                  child: Text(
                    Strings.active_cases.tr(),
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => context.pushNamed(AppRoutes.requests.name),
                  child: Text(Strings.view_all.tr()),
                ),
              ],
            ),
            UIConstants.smallHeight,
            if (data.previewRequest == null)
              _EmptyCaseCard(
                onTap: () => context.pushNamed(AppRoutes.requests.name),
              )
            else
              _ActiveCaseCard(
                request: data.previewRequest!,
                clientName: data.previewClientName ?? Strings.user.tr(),
                specializationName:
                    data.previewSpecializationName ??
                    Strings.request_consultation.tr(),
              ),
          ],
        );
      },
    );
  }
}

class _LawyerHomeSnapshot {
  const _LawyerHomeSnapshot({
    required this.pendingConsultations,
    required this.pendingTraining,
    this.previewRequest,
    this.previewClientName,
    this.previewSpecializationName,
  });

  final int pendingConsultations;
  final int pendingTraining;
  final ConsultationRequestEntity? previewRequest;
  final String? previewClientName;
  final String? previewSpecializationName;
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.title,
    required this.count,
    required this.onTap,
  });

  final String title;
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final arrowIcon = context.isRTL ? Icons.arrow_back : Icons.arrow_forward;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(22),
          boxShadow: context.shadowSoft,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            UIConstants.mediumHeight,
            Row(
              children: [
                Icon(
                  arrowIcon,
                  color: context.colors.onSurfaceVariant,
                  size: 18,
                ),
                UIConstants.smallWidth,
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    count.toString(),
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.colors.onPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActiveCaseCard extends StatelessWidget {
  const _ActiveCaseCard({
    required this.request,
    required this.clientName,
    required this.specializationName,
  });

  final ConsultationRequestEntity request;
  final String clientName;
  final String specializationName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(
        AppRoutes.consultationDetails.name,
        extra: ConsultationRequestDetailsArgs(request: request),
      ),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(24),
          boxShadow: context.shadowSoft,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: context.colors.primary,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                specializationName,
                textAlign: TextAlign.center,
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colors.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            UIConstants.mediumHeight,
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: context.colors.surface,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: context.colors.onSurface,
                    size: 18,
                  ),
                ),
                UIConstants.smallWidth,
                Expanded(
                  child: Text(
                    clientName,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: context.colors.surface,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_outline,
                    color: context.colors.onSurfaceVariant,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyCaseCard extends StatelessWidget {
  const _EmptyCaseCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          Strings.no_data_to_display.tr(),
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colors.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/back_button.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_text2_feild.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_classification_result_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_recommendation_entity.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/discovery/presentation/blocs/ai_consultation/ai_consultation_cubit.dart';
import 'package:silah_app/features/discovery/presentation/views/ai_consultation/widgets/ai_badge_icon.dart';
import 'package:silah_app/features/discovery/presentation/views/ai_consultation/widgets/ai_loading_view.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';

class AiConsultationBody extends StatefulWidget {
  const AiConsultationBody({super.key});

  @override
  State<AiConsultationBody> createState() => _AiConsultationBodyState();
}

class _AiConsultationBodyState extends State<AiConsultationBody> {
  final TextEditingController _controller = TextEditingController();
  bool _canSubmit = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChange);
    _controller.dispose();
    super.dispose();
  }

  void _handleTextChange() {
    final canSubmit = _controller.text.trim().isNotEmpty;
    if (canSubmit == _canSubmit) return;
    setState(() => _canSubmit = canSubmit);
  }

  void _submit(BuildContext context) {
    context.read<AiConsultationCubit>().submit(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiConsultationCubit, AiConsultationState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const AiLoadingView(),
          orElse: () => _buildContent(context, state),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, AiConsultationState state) {
    final errorMessage = state.maybeWhen(
      failure: (message) => message,
      orElse: () => null,
    );
    final successData = state.maybeWhen(
      success: (classification, recommendation) =>
          _AiResultData(classification: classification, recommendation: recommendation),
      orElse: () => null,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: UIConstants.screenHorizantalPadding,
        vertical: UIConstants.bigPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomeBackButton(onPressed: () => context.pop()),
              const Spacer(),
              const AiBadgeIcon(size: 48),
            ],
          ),
          UIConstants.bigHeight,
          Text(
            Strings.find_right_lawyers_with_ai.tr(),
            style: context.textTheme.headlineSmall?.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          UIConstants.mediumHeight,
          Text(
            Strings.describe_case_choose_best_lawyer.tr(),
            style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onSurfaceVariant),
          ),
          UIConstants.bigHeight,
          _PromptCard(
            controller: _controller,
            onSubmit: _canSubmit ? () => _submit(context) : null,
          ),
          if (errorMessage != null) ...[
            UIConstants.mediumHeight,
            _ErrorBanner(message: errorMessage),
          ],
          if (successData != null) ...[
            UIConstants.bigHeight,
            _AiRecommendationSection(data: successData),
          ],
        ],
      ),
    );
  }
}

class _PromptCard extends StatelessWidget {
  const _PromptCard({required this.controller, this.onSubmit});

  final TextEditingController controller;
  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    final borderColor = context.colors.outlineVariant.withAlphaOpacity(0.4);
    final sendEnabled = onSubmit != null;

    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 56),
            child: FTextField(
              controller: controller,
              maxLines: 7,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              showLabel: false,
              hintText: Strings.example_issue_civil_dispute_unpaid_service.tr(),
            ),
          ),
          PositionedDirectional(
            start: 12,
            bottom: 12,
            child: _SubmitButton(enabled: sendEnabled, onTap: onSubmit),
          ),
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({required this.enabled, this.onTap});

  final bool enabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final background = enabled
        ? context.colors.primary
        : context.colors.primary.withAlphaOpacity(0.25);
    final foreground =
        enabled ? context.colors.onPrimary : context.colors.onSurfaceVariant.withAlphaOpacity(0.6);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(color: background, shape: BoxShape.circle),
          child: Icon(Icons.arrow_upward_rounded, color: foreground, size: 20),
        ),
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.errorContainer.withAlphaOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        message,
        style: context.textTheme.bodySmall?.copyWith(color: context.colors.onErrorContainer),
      ),
    );
  }
}

class _AiResultData {
  final AiClassificationResultEntity classification;
  final AiRecommendationEntity recommendation;

  const _AiResultData({required this.classification, required this.recommendation});
}

class _AiRecommendationSection extends StatelessWidget {
  const _AiRecommendationSection({required this.data});

  final _AiResultData data;

  @override
  Widget build(BuildContext context) {
    final specialization = _resolveSpecialization(
      data.classification,
      data.recommendation,
    );
    final lawyers = data.recommendation.lawyers ?? const <LawyerProfileEntity>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.specializations.tr(),
          style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        UIConstants.smallHeight,
        _SpecializationChip(label: specialization?.name),
        UIConstants.bigHeight,
        Text(
          Strings.licensed_lawyers.tr(),
          style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        UIConstants.smallHeight,
        if (lawyers.isEmpty)
          Text(
            Strings.no_data_to_display.tr(),
            style: context.textTheme.bodyMedium?.copyWith(color: context.colors.onSurfaceVariant),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => _LawyerTile(lawyer: lawyers[index]),
            separatorBuilder: (_, __) => UIConstants.smallHeight,
            itemCount: lawyers.length,
          ),
      ],
    );
  }

  LegalSpecializationEntity? _resolveSpecialization(
    AiClassificationResultEntity classification,
    AiRecommendationEntity recommendation,
  ) {
    return classification.specialization ?? recommendation.specialization;
  }
}

class _SpecializationChip extends StatelessWidget {
  const _SpecializationChip({required this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    final text = (label == null || label!.trim().isEmpty)
        ? Strings.not_available.tr()
        : label!.trim();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: context.colors.primaryContainer.withAlphaOpacity(0.25),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: context.colors.primary.withAlphaOpacity(0.2)),
      ),
      child: Text(
        text,
        style: context.textTheme.labelMedium?.copyWith(color: context.colors.primary),
      ),
    );
  }
}

class _LawyerTile extends StatelessWidget {
  const _LawyerTile({required this.lawyer});

  final LawyerProfileEntity lawyer;

  @override
  Widget build(BuildContext context) {
    final name = lawyer.fullName?.trim();
    final city = lawyer.city?.trim();
    final initials = (name != null && name.isNotEmpty) ? name.characters.first : '?';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: context.colors.outlineVariant.withAlphaOpacity(0.3)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: context.colors.primaryContainer.withAlphaOpacity(0.4),
            child: Text(
              initials,
              style: context.textTheme.labelMedium?.copyWith(color: context.colors.primary),
            ),
          ),
          UIConstants.mediumWidth,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? Strings.not_available.tr(),
                  style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                if (city != null && city.isNotEmpty)
                  Text(
                    city,
                    style:
                        context.textTheme.bodySmall?.copyWith(color: context.colors.onSurfaceVariant),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

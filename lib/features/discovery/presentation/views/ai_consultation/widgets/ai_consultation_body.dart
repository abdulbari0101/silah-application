import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/back_button.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_text2_feild.dart';
import 'package:silah_app/features/consultations/presentation/views/create_request/models/consultation_request_args.dart';
import 'package:silah_app/features/discovery/domain/entities/ai_recommendation_entity.dart';
import 'package:silah_app/features/discovery/presentation/blocs/ai_consultation/ai_consultation_cubit.dart';
import 'package:silah_app/features/discovery/presentation/views/ai_consultation/widgets/ai_badge_icon.dart';
import 'package:silah_app/features/discovery/presentation/views/ai_consultation/widgets/ai_loading_view.dart';
import 'package:silah_app/features/discovery/presentation/views/search/widgets/lawyer_result_card.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';

class AiConsultationBody extends StatefulWidget {
  const AiConsultationBody({super.key});

  @override
  State<AiConsultationBody> createState() => _AiConsultationBodyState();
}

class _AiConsultationBodyState extends State<AiConsultationBody> {
  final TextEditingController _controller = TextEditingController();
  bool _canSubmit = false;
  _AiPromptStage _promptStage = _AiPromptStage.input;
  String? _pendingPrompt;

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

  void _openReview() {
    final prompt = _controller.text.trim();
    if (prompt.isEmpty) return;
    setState(() {
      _pendingPrompt = prompt;
      _promptStage = _AiPromptStage.review;
    });
  }

  void _confirmSubmit(BuildContext context) {
    final prompt = _pendingPrompt?.trim();
    if (prompt == null || prompt.isEmpty) return;
    context.read<AiConsultationCubit>().submit(prompt);
  }

  void _editPrompt() {
    final prompt = _pendingPrompt;
    if (prompt != null && prompt.isNotEmpty) {
      _controller.text = prompt;
    }
    setState(() => _promptStage = _AiPromptStage.input);
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
      success: (recommendation) => recommendation,
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
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
          UIConstants.bigHeight,
          if (_promptStage == _AiPromptStage.input)
            _buildPromptCard()
          else
            _buildReviewCard(),
          if (errorMessage != null) ...[
            UIConstants.mediumHeight,
            _buildErrorBanner(errorMessage),
          ],
          if (successData != null) ...[
            UIConstants.bigHeight,
            _buildRecommendationSection(successData),
          ],
        ],
      ),
    );
  }

  Widget _buildPromptCard() {
    final borderColor = context.colors.outlineVariant.withAlphaOpacity(0.4);
    final sendEnabled = _canSubmit;

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
              controller: _controller,
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
            child: _buildSubmitButton(
              enabled: sendEnabled,
              onTap: sendEnabled ? _openReview : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard() {
    final borderColor = context.colors.outlineVariant.withAlphaOpacity(0.4);
    final prompt = _pendingPrompt ?? '';
    return InkWell(
      onTap: _editPrompt,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: borderColor),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 56),
              child: Text(
                prompt.isNotEmpty ? prompt : Strings.not_available.tr(),
                style: context.textTheme.bodyMedium,
              ),
            ),
            PositionedDirectional(
              start: 12,
              bottom: 12,
              child: _buildSubmitButton(
                enabled: true,
                onTap: () => _confirmSubmit(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton({required bool enabled, VoidCallback? onTap}) {
    final background = enabled
        ? context.colors.primary
        : context.colors.primary.withAlphaOpacity(0.25);
    final foreground = enabled
        ? context.colors.onPrimary
        : context.colors.onSurfaceVariant.withAlphaOpacity(0.6);

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

  Widget _buildErrorBanner(String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.errorContainer.withAlphaOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        message,
        style: context.textTheme.bodySmall?.copyWith(
          color: context.colors.onErrorContainer,
        ),
      ),
    );
  }

  Widget _buildRecommendationSection(AiRecommendationEntity recommendation) {
    final specialization = recommendation.specialization;
    final lawyers = recommendation.lawyers ?? const <LawyerProfileEntity>[];
    final specializationId = specialization?.id;
    final specializationLabel = specialization?.name;
    final displayLabel = specializationLabel ?? Strings.not_available.tr();
    final canRequest =
        specializationId != null && specializationId.trim().isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.specializations.tr(),
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        UIConstants.smallHeight,
        _buildSpecializationChip(displayLabel),
        UIConstants.bigHeight,
        Text(
          Strings.licensed_lawyers.tr(),
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        UIConstants.smallHeight,
        if (lawyers.isEmpty)
          Text(
            Strings.no_data_to_display.tr(),
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final lawyer = lawyers[index];
              return LawyerResultCard(
                lawyer: lawyer,
                specializationLabel: displayLabel,
                specializationId: specializationId,
                onRequestConsultation: canRequest
                    ? () => _openRequest(
                        context,
                        lawyer,
                        specializationId,
                        specializationLabel,
                      )
                    : null,
              );
            },
            separatorBuilder: (_, __) => UIConstants.smallHeight,
            itemCount: lawyers.length,
          ),
      ],
    );
  }

  Widget _buildSpecializationChip(String? label) {
    final text = (label == null || label.trim().isEmpty)
        ? Strings.not_available.tr()
        : label.trim();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: context.colors.primaryContainer.withAlphaOpacity(0.25),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: context.colors.primary.withAlphaOpacity(0.2)),
      ),
      child: Text(
        text,
        style: context.textTheme.labelMedium?.copyWith(
          color: context.colors.primary,
        ),
      ),
    );
  }

  void _openRequest(
    BuildContext context,
    LawyerProfileEntity lawyer,
    String? specializationId,
    String? specializationLabel,
  ) {
    context.pushNamed(
      AppRoutes.requestConsultation.name,
      extra: ConsultationRequestArgs(
        lawyer: lawyer,
        specializationId: specializationId,
        specializationLabel: specializationLabel,
      ),
    );
  }
}

enum _AiPromptStage { input, review }

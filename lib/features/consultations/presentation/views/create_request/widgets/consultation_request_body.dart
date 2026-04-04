import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_progress.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/lawyer_summary_card.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_text2_feild.dart';
import 'package:silah_app/core/presentation/ui/widget/text/section_title.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_request_entity.dart';
import 'package:silah_app/features/consultations/presentation/cubits/create_request/consultation_request_cubit.dart';
import 'package:silah_app/features/consultations/presentation/views/create_request/models/consultation_request_args.dart';

class ConsultationRequestBody extends StatefulWidget {
  const ConsultationRequestBody({super.key, required this.args});

  final ConsultationRequestArgs args;

  @override
  State<ConsultationRequestBody> createState() =>
      _ConsultationRequestBodyState();
}

class _ConsultationRequestBodyState extends State<ConsultationRequestBody> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    final user = context.read<AppStateBloc>().state.data.customer;
    if (user?.uid == null || user!.uid!.isEmpty) {
      Toasts.error(context, Strings.unexpected_error.tr());
      return;
    }

    final lawyerId = widget.args.lawyer.id;
    if (lawyerId == null || lawyerId.trim().isEmpty) {
      Toasts.error(context, Strings.unexpected_error.tr());
      return;
    }

    if (!(_formKey.currentState?.validate() ?? false)) return;

    final specializationId = _resolveSpecializationId();
    if (specializationId == null || specializationId.trim().isEmpty) {
      Toasts.error(context, Strings.choose_specialization.tr());
      return;
    }

    final request = ConsultationRequestEntity(
      clientId: user.uid,
      lawyerId: lawyerId,
      specializationId: specializationId,
      description: _descriptionController.text.trim(),
    );

    context.read<ConsultationRequestCubit>().submit(request);
  }

  String? _resolveSpecializationId() {
    final id = widget.args.specializationId?.trim();
    if (id != null && id.isNotEmpty) return id;
    final label = widget.args.specializationLabel?.trim();
    return (label != null && label.isNotEmpty) ? label : null;
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select<AppStateBloc, AuthUserEntity?>(
      (bloc) => bloc.state.data.customer,
    );

    if (user == null) {
      return Center(child: Text(Strings.unexpected_error.tr()));
    }

    final specializationLabel = _resolveSpecializationLabel();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: UIConstants.screenHorizantalPadding,
        vertical: UIConstants.bigPadding,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: Strings.request_consultation.tr()),
            UIConstants.bigHeight,
            LawyerSummaryCard(
              name: widget.args.lawyer.fullName ?? Strings.not_available.tr(),
              specialization: specializationLabel,
              experienceLabel: _experienceLabel(),
              avatarUrl: widget.args.lawyer.avatarUrl,
            ),
            UIConstants.bigHeight,
            Text(
              Strings.please_describe_the_issue.tr(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            UIConstants.smallHeight,
            FTextField(
              controller: _descriptionController,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              hintText: Strings.describe_case_choose_best_lawyer.tr(),
              validator: (value) {
                final text = value?.trim() ?? '';
                return text.isEmpty ? Strings.error_fill_form.tr() : null;
              },
            ),
            UIConstants.bigHeight,
            BlocBuilder<ConsultationRequestCubit, ConsultationRequestState>(
              builder: (context, state) {
                final isLoading = state.maybeWhen(
                  submitting: () => true,
                  orElse: () => false,
                );
                return PrimaryButtonWithProgress(
                  text: Strings.start_consultation_now.tr(),
                  isLoading: isLoading,
                  onTap: isLoading ? null : () => _submit(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String? _resolveSpecializationLabel() {
    final label = widget.args.specializationLabel?.trim();
    if (label != null && label.isNotEmpty) return label;
    final id = widget.args.specializationId?.trim();
    return (id != null && id.isNotEmpty) ? id : null;
  }

  String? _experienceLabel() {
    final years = widget.args.lawyer.yearsOfExperience;
    if (years == null) return null;
    return '${Strings.years_of_experience.tr()} • $years';
  }
}

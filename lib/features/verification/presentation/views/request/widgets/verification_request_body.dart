import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_progress.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_text2_feild.dart';
import 'package:silah_app/features/verification/presentation/cubits/request/verification_request_cubit.dart';

class VerificationRequestBody extends StatefulWidget {
  const VerificationRequestBody({super.key});

  @override
  State<VerificationRequestBody> createState() =>
      _VerificationRequestBodyState();
}

class _VerificationRequestBodyState extends State<VerificationRequestBody> {
  final _licenseController = TextEditingController();
  final _nationalIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _licenseController.dispose();
    _nationalIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: UIConstants.screenHorizantalPadding,
          vertical: UIConstants.bigPadding,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FTextField(
                controller: _licenseController,
                labelText: Strings.license_number.tr(),
                hintText: Strings.license_number.tr(),
                validator: _requiredValidator,
              ),
              UIConstants.mediumHeight,
              FTextField(
                controller: _nationalIdController,
                labelText: Strings.national_id.tr(),
                hintText: Strings.national_id.tr(),
                validator: _requiredValidator,
              ),
              UIConstants.bigHeight,
              BlocBuilder<VerificationRequestCubit, VerificationRequestState>(
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                    submitting: () => true,
                    orElse: () => false,
                  );
                  return PrimaryButtonWithProgress(
                    text: Strings.send_verification.tr(),
                    isLoading: isLoading,
                    onTap: isLoading
                        ? null
                        : () {
                            if (!(_formKey.currentState?.validate() ?? false)) {
                              return;
                            }
                            context.read<VerificationRequestCubit>().submit(
                              licenseNumber: _licenseController.text,
                              nationalId: _nationalIdController.text,
                            );
                          },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _requiredValidator(String? value) {
    final text = value?.trim() ?? '';
    return text.isEmpty ? Strings.error_fill_form.tr() : null;
  }
}

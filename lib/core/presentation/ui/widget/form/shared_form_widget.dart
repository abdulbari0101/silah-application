import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/form_cubit.dart';

class SharedFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<Widget> fields;
  final Widget button;
  // final VoidCallback onSubmit;
  const SharedFormWidget({
    super.key,
    required this.formKey,
    required this.fields,
    required this.button, // required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Form(
              onChanged: () {
                final isValid = formKey.currentState?.validate() ?? false;
                context.read<FormCubit>().updateValidity(isValid);
              },
              key: formKey,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [...fields]),
            ),
          ),
        ),

        Column(children: [button]),
      ],
    );
  }
}

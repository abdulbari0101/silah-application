import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/extensions/app_setting_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/cubits/form_cubit.dart';
import 'package:silah_app/core/presentation/ui/overlays/sheets/adaptive_bottom_sheet.dart';
import 'package:silah_app/core/presentation/ui/widget/appbar/custome_screen_header.dart';
import 'package:silah_app/gen/assets.gen.dart';

import '../../../../../../../core/config/localization/language_sheet.dart';
import 'form.dart';
import 'version_widget.dart';
import 'welcom_message.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormCubit(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final viewInsets = MediaQuery.of(context).viewInsets;
          final isKeyboardOpen = viewInsets.bottom > 0;
          final bottomSpacing = constraints.maxHeight * (isKeyboardOpen ? 0.08 : 0.2);

          return Stack(
            children: [
              Positioned(
                bottom: 7,
                right: context.languageCode == "en" ? 5 : null,
                left: context.languageCode == "ar" ? 5 : null,
                child: AnimatedOpacity(
                  opacity: isKeyboardOpen ? 0 : 1,
                  duration: const Duration(milliseconds: 150),
                  child: IgnorePointer(ignoring: isKeyboardOpen, child: const VersionWidget()),
                ),
              ),

              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: viewInsets.bottom),
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: isKeyboardOpen
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      CustomeScreenHeader(
                        showCallUsButton: false,
                        svgIcon: Assets.icons.icLanguage,
                        onTap: () {
                          AdaptiveBottomSheet.show(
                            context: context,
                            builder: (context) => LanguageSheet(),
                          );
                        },
                      ),
                      const LoginWelcomText(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const LoginForm(),
                          SizedBox(height: bottomSpacing),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

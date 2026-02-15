import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

import 'package:silah_app/core/presentation/state_magment/blocs/app_state/extensions/app_state_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';

class ForgetPasswordField extends StatelessWidget {
  const ForgetPasswordField({super.key});

  void _handleTap(BuildContext context) {
    debugPrint("ForgetPasswordField tapped");

    final isReturningUser = context.userAuthStatus == UserAuthStatus.loggedOutReturningUser;
    debugPrint("User status: ${context.userAuthStatus}, isReturningUser: $isReturningUser");



  

  }

  @override
  Widget build(BuildContext context) {
    //     Future.delayed(Duration(seconds: 4)).then((vlaue){
    //        throw StateError('test ui error');
    //     });

    //     Future.delayed(const Duration(seconds: 4), () {
    //   UiErrorBus.i.emit(UiError(
    //     title: "Test UI error",
    //     message: "This is a simulated UI error",
    //     error: StateError('test ui error'),
    //     stack: StackTrace.current,
    //   ));
    // });

    return Visibility(
      visible: false,
      child: InkWell(
        splashColor: context.colors.primary,
        //  onTap: () => _handleTap(context),
        onTap: () {
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(Strings.forget_password.tr(), style: context.textTheme.titleMedium),
          ),
        ),
      ),
    );
  }
}

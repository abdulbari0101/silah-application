import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/screen_padding_wrapper.dart';

import 'welcome_actions.dart';
import 'welcome_header.dart';
import 'welcome_roles_card.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenPaddingWrapper(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    UIConstants.bigHeight,
                    const WelcomeHeader(),
                    UIConstants.xbigHeight,
                    const WelcomeRolesCard(),
                    const Spacer(),
                    const WelcomeActions(),
                    UIConstants.bigHeight,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

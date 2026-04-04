import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/gen/assets.gen.dart';

import '../../shared/widget/auth_curved_scaffold.dart';

class AuthFormScaffold extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;
  final VoidCallback? onBack;
  final bool showLogo;

  const AuthFormScaffold({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.onBack,
    this.showLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    return AuthCurvedScaffold(
      headerPadding: const EdgeInsets.fromLTRB(
        UIConstants.screenHorizantalPadding,
        UIConstants.bigPadding,
        UIConstants.screenHorizantalPadding,
        UIConstants.bigPadding,
      ),
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (onBack != null)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: context.colors.primary,
                ),
                onPressed: onBack,
              ),
            ),
          if (showLogo) ...[
            Center(
              child: Assets.images.silahLogo1.image(
                width: 130,
                fit: BoxFit.contain,
              ),
            ),
            UIConstants.mediumHeight,
          ],
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge?.bold.primary(context),
          ),
          if (subtitle != null) ...[
            UIConstants.smallHeight,
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall?.onSurfaceVariant(context),
            ),
          ],
        ],
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/gen/assets.gen.dart';

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
    return PlatformScreenWrapper(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: UIConstants.screenHorizantalPadding,
            vertical: UIConstants.mediumPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (onBack != null)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: onBack,
                  ),
                ),
              if (showLogo) ...[
                Center(
                  child: Assets.images.silahLogo1.image(width: 120, fit: BoxFit.contain),
                ),
                UIConstants.bigHeight,
              ],
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge?.primary(context),
              ),
              if (subtitle != null) ...[
                UIConstants.smallHeight,
                Text(
                  subtitle!,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodySmall?.onSurfaceVariant(context),
                ),
              ],
              UIConstants.xbigHeight,
              child,
            ],
          ),
        ),
      ),
    );
  }
}

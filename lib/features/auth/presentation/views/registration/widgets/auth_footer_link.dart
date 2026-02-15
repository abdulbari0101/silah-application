import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class AuthFooterLink extends StatelessWidget {
  final String leadingText;
  final String actionText;
  final VoidCallback onTap;

  const AuthFooterLink({
    super.key,
    required this.leadingText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(leadingText, style: context.textTheme.bodySmall),
        UIConstants.smallWidth,
        TextButton(
          onPressed: onTap,
          child: Text(
            actionText,
            style: context.textTheme.titleSmall?.copyWith(color: context.colors.primary),
          ),
        ),
      ],
    );
  }
}

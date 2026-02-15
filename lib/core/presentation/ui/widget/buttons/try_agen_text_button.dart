import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';

class FTextIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? label;
  final IconData? icon;

  const FTextIconButton({super.key, this.onTap, this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: onTap,
        icon: Icon(icon ?? Icons.refresh, size: 20),
        label: Text(label ?? Strings.try_again.tr()),
      ),
    );
  }
}

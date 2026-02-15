import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class SuccessCheckMarkIcon extends StatelessWidget {
  const SuccessCheckMarkIcon({super.key, this.colorIcon});

  final Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colors.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlphaOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.white,
        child: Icon(Icons.check_rounded, color: colorIcon, size: 60),
      ),
    );
  }
}

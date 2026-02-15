import 'package:flutter/material.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    super.key,
    required this.icon,
    required this.press,
    this.showShadow = true,
    this.color,
    this.iconColor,
    this.iconSize,
    this.size = 40,
  });
  final Color? color;

  final Color? iconColor;

  final IconData icon;
  final Function()? press;
  final bool showShadow;
  final double size;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero, backgroundColor: color),
        onPressed: press,
        child: Icon(icon, size: iconSize, color: iconColor),
      ),
    );
  }
}

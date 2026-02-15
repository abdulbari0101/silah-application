import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class SheetHeader extends StatelessWidget {
  const SheetHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () => context.pop(), icon: Icon(Icons.close)),
        const SizedBox(width: 8),
        Expanded(child: Text(title, style: context.textTheme.titleMedium?.primaryDark(context))),
      ],
    );
  }
}

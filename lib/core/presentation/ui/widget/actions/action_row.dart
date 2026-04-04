import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({super.key, required this.actions});

  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    if (actions.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      children:
          actions
              .expand(
                (widget) => [Expanded(child: widget), UIConstants.smallWidth],
              )
              .toList()
            ..removeLast(),
    );
  }
}

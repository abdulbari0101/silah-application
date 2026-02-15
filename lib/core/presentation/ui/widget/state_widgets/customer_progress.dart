import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/progress_button.dart';

class CustomerProgress extends StatelessWidget {
  const CustomerProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: ProgressButton(size: UIConstants.buttonHeight * 1.2));
  }
}

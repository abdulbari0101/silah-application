import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_setting_bloc.dart';

class UserSettingBlocBuilder extends StatelessWidget {
  const UserSettingBlocBuilder({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserSettingBloc, UserSettingState>(
      builder: (context, state) {
        return child;
      },
    );
  }
}

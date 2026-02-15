import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';

class AppStateBlocBuilder extends StatelessWidget {
  const AppStateBlocBuilder({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateBloc, AppStateState>(
      builder: (context, state) {
        return child;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../user_setting_bloc.dart';

extension UserSettingContext on BuildContext {
  /// Reads the AppStateData from UserSettingBloc without rebuilding
  UserSettingState get userSettingState => read<UserSettingBloc>().state;

  /// Reads whether the user is logged in
  bool get isUserSettingLoaded => userSettingState is UserSettingLoaded;
}

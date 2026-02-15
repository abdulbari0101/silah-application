import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../sesstion_bloc.dart';

extension SessionContext on BuildContext {
  /// Reads the AppStateData from SessionBloc without rebuilding
  SessionState get settingState => read<SessionBloc>().state;
}

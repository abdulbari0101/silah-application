import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/domain/entities/api/auth/customer_entity.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_state_data.dart';


extension AppStateContext on BuildContext {
  /// Reads the AppStateData from AppStateBloc without rebuilding
  AppStateState get appStateState => read<AppStateBloc>().state;
  AppStateData get appStateData => appStateState.data;
  bool get isAppStateLoaded => appStateState is AppStateLoaded;

  /// Reads whether the user is logged in
  bool get isLoggedIn => appStateData.isLoggedIn;

  CustomerEntity? get customer => appStateData.customer;



  /// Reads the current user auth status (e.g. loggedInFullyVerified, etc.)
  UserAuthStatus get userAuthStatus => appStateData.userAuthStatus;

}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/infrastructure/errors/error_utils.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/bloc_utils/bloc_utils.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/secondary_button.dart';
import 'package:silah_app/features/auth/domain/repositories/auth_repository.dart';

class HomeLogoutSection extends StatelessWidget {
  const HomeLogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      text: Strings.log_out.tr(),
      borderColor: context.colors.primary,
      onTap: () => _handleLogout(context),
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
    final result = await locator<AuthRepo>().signOut();
    result.fold(
      (failure) => Toasts.error(
        context,
        BlocUtils.mergeCodeWithMessage(
          failure,
          codeToMessageMap,
          includeCodeLine: false,
          fallbackMessage: Strings.unexpected_error,
        ),
      ),
      (_) {
        context.read<AppStateBloc>().add(
          UpdateSession(
            isLoggedIn: false,
            userAuthStatus: UserAuthStatus.loggedOutReturningUser,
          ),
        );
        context.goNamed(AppRoutes.login.name);
      },
    );
  }
}

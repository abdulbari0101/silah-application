import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/notifications/presentation/cubits/notifications/notifications_cubit.dart';
import 'package:silah_app/features/notifications/presentation/views/notifications/widgets/notifications_body.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationsCubit(repository: locator())..load(),
      child: Builder(
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              await context.read<NotificationsCubit>().markAllSeen();
              return true;
            },
            child: PlatformScreenWrapper(
              title: Strings.notification.tr(),
              body: const NotificationsBody(),
            ),
          );
        },
      ),
    );
  }
}

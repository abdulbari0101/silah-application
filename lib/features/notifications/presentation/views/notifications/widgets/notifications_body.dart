import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_result.dart';
import 'package:silah_app/features/notifications/presentation/cubits/notifications/notifications_cubit.dart';
import 'package:silah_app/features/notifications/presentation/views/notifications/widgets/notification_item_card.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: ProgressStateWidget()),
            empty: () => _buildEmpty(context),
            failure: (message) => _buildError(context, message),
            ready: (result) => _buildList(context, result),
          );
        },
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UIConstants.screenHorizantalPadding),
      child: EmptyWidget(title: Strings.no_data_to_display.tr()),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Padding(
      padding: const EdgeInsets.all(UIConstants.screenHorizantalPadding),
      child: CustomeErrorWidget(
        message: message,
        onRetry: () => context.read<NotificationsCubit>().load(),
      ),
    );
  }

  Widget _buildList(BuildContext context, NotificationResult result) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: UIConstants.screenHorizantalPadding,
        vertical: UIConstants.bigPadding,
      ),
      itemBuilder: (context, index) {
        final notification = result.notifications[index];
        return NotificationItemCard(notification: notification);
      },
      separatorBuilder: (_, __) => UIConstants.smallHeight,
      itemCount: result.notifications.length,
    );
  }
}

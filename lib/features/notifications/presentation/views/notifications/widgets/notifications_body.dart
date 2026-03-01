import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_group.dart';
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
    final groups = result.groups ?? const <NotificationGroup>[];
    final children = <Widget>[];

    for (final group in groups) {
      children.add(_buildHeader(context, group.headerDate));
      final items = group.notifications ?? const [];
      for (final notification in items) {
        children.add(NotificationItemCard(notification: notification));
        children.add(UIConstants.smallHeight);
      }
      children.add(UIConstants.mediumHeight);
    }

    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: UIConstants.screenHorizantalPadding,
        vertical: UIConstants.bigPadding,
      ),
      children: children,
    );
  }

  Widget _buildHeader(BuildContext context, String rawDate) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        _formatDate(context, rawDate),
        style: context.textTheme.labelLarge?.copyWith(
          color: context.colors.onSurfaceVariant,
        ),
      ),
    );
  }

  String _formatDate(BuildContext context, String rawDate) {
    final parsed = DateTime.tryParse(rawDate);
    if (parsed == null) return rawDate;
    return MaterialLocalizations.of(context).formatFullDate(parsed);
  }
}

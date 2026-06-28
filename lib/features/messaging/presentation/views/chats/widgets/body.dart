import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/features/messaging/presentation/cubits/chat_threads/chat_threads_cubit.dart';
import 'package:silah_app/features/messaging/presentation/views/chats/widgets/chats_builder.dart';

class ChatsBody extends StatefulWidget {
  const ChatsBody({super.key, this.onRefresh});

  final VoidCallback? onRefresh;

  @override
  State<ChatsBody> createState() => _ChatsBodyState();
}

class _ChatsBodyState extends State<ChatsBody> {
  ChatCategory _category = ChatCategory.consultation;

  Future<void> _handleRefresh(BuildContext context) async {
    if (widget.onRefresh != null) {
      widget.onRefresh!.call();
    } else {
      await context.read<ChatThreadsCubit>().load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(UIConstants.mediumPadding),
        child: Column(
          children: [
            Row(
              children: [
                _buildCategoryTab(
                  label: Strings.consultation_requests.tr(),
                  icon: Icons.gavel_outlined,
                  isSelected: _category == ChatCategory.consultation,
                  onTap: () => setState(() => _category = ChatCategory.consultation),
                ),
                UIConstants.mediumWidth,
                _buildCategoryTab(
                  label: Strings.training_requests.tr(),
                  icon: Icons.school_outlined,
                  isSelected: _category == ChatCategory.training,
                  onTap: () => setState(() => _category = ChatCategory.training),
                ),
              ],
            ),
            UIConstants.mediumHeight,
            Expanded(
              child: RefreshIndicator(
                edgeOffset: UIConstants.mediumPadding,
                onRefresh: () => _handleRefresh(context),
                child: ChatThreadsBuilder(category: _category),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTab({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected
                ? context.colors.primary.withValues(alpha: 0.1)
                : context.colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? context.colors.primary
                  : context.colors.outlineVariant.withValues(alpha: 0.5),
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? context.colors.primary : context.colors.onSurfaceVariant,
                size: 20,
              ),
              UIConstants.smallWidth,
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: isSelected ? context.colors.primary : context.colors.onSurfaceVariant,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

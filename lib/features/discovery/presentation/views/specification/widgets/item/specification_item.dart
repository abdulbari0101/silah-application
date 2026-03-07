import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/card_button.dart';
import 'package:silah_app/core/presentation/ui/widget/image/app_remote_icon.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/gen/assets.gen.dart';

class SpecificationItem extends StatelessWidget {
  const SpecificationItem({
    super.key,
    required this.item,
    this.onTap,
    this.enabled = true,
  });

  final LegalSpecializationEntity item;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final content = CardButton(
      onTap: enabled ? onTap : null,
      borderRadius: context.shapes.brLg,
      borderColor: context.colors.outlineVariant.withAlphaOpacity(0.4),
      color: context.colors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIcon(context),
          UIConstants.smallHeight,
          Text(
            _displayName(context),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.labelMedium,
          ),
        ],
      ),
    );

    if (enabled) {
      return content;
    }

    return Opacity(opacity: 0.45, child: content);
  }

  String _displayName(BuildContext context) {
    final langCode = context.locale.languageCode.toLowerCase();
    if (langCode == 'en') {
      return item.code ?? item.name ?? '';
    }
    return item.name ?? item.code ?? '';
  }

  Widget _buildIcon(BuildContext context) {
    return AppRemoteIcon(
      size: 20,
      imageUrl: item.iconUrl,
      fit: BoxFit.contain,
      borderRadius: BorderRadius.circular(6),
      backgroundColor: Colors.transparent,
      fallback: AppSvgIcon(
        assetName: Assets.icons.mobile,
        width: 20,
        height: 20,
        fit: BoxFit.contain,
        darkDynamicColor: false,
        lightDynamicColor: false,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';

import '../icons/arrow_next_icon.dart';

class ServiceItem extends StatelessWidget {
  final String? icon;
  final String serviceName;
  final String? serviceDesc;
  final bool showArrowNext;
  final Function()? onItemClicked;
  final Function()? onTap;

  const ServiceItem({
    super.key,
    this.icon,
    required this.serviceName,
    this.serviceDesc,
    this.showArrowNext = true,
    this.onItemClicked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // splashColor: context.colors.primary,
      borderRadius: context.shapes.brSm,
      // splashFactory: InkSplash.splashFactory,
      highlightColor: context.colors.primary,
      onTap: _onTapD,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: UIConstants.mediumPadding,
          vertical: UIConstants.mediumPadding,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) AppSvgIcon(assetName: icon!, width: 20, height: 20),
            if (icon != null) UIConstants.bigWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(serviceName, style: context.textTheme.labelLarge),
                  UIConstants.xsmallHeight,
                  if (serviceDesc != null)
                    Text(
                      serviceDesc!,
                      style: context.textTheme.labelSmall!.onSurfaceVariant(context),
                    ),
                ],
              ),
            ),
            UIConstants.bigWidth,

            Visibility(
              visible: showArrowNext,
              child: ArrowNextIcon(size: SizeIcon.SIZE_24, useSvg: true),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onTapD() async {
    await Future.delayed(const Duration(milliseconds: 100));
    onItemClicked?.call();
    onTap?.call();
  }
}

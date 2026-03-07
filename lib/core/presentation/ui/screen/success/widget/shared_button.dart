import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/secondary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/gen/assets.gen.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key, required this.onShareTap, this.label});

  final Function()? onShareTap;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final spacing = AppDimension(context).height * 0.03;

    return Column(
      children: [
        SecondaryButton(
          text: label?.trim().isNotEmpty == true
              ? label!.trim()
              : Strings.share_receipt.tr(),
          onTap: onShareTap,
          prefixWidget: AppSvgIcon(
            assetName: Assets.icons.share,
            lightDynamicColor: true,
          ),
        ),
        SizedBox(height: spacing),
      ],
    );
  }
}

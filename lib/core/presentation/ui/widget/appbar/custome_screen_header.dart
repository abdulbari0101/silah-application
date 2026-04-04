import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:silah_app/core/config/constants/app_constants.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/wrapper/app_state_bloc_builder.dart';
import 'package:silah_app/core/presentation/ui/overlays/sheets/call_us_sheet.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/gen/assets.gen.dart';

class CustomeScreenHeader extends StatelessWidget {
  final bool showCallUsButton;

  const CustomeScreenHeader({
    super.key,
    required this.onTap,
    required this.svgIcon,
    this.showCallUsButton = true,
  });
  final Function() onTap;
  final svgIcon;

  @override
  Widget build(BuildContext context) {
    return AppStateBlocBuilder(
      child: BlocBuilder<AppSettingBloc, AppSettingState>(
        builder: (context, state) {
          final selectedLang = state.data.language;

          return Padding(
            padding: const EdgeInsets.only(
              right: UIConstants.defaultPadding,
              left: UIConstants.defaultPadding,
              top: UIConstants.defaultPadding,
            ),
            child: Row(
              mainAxisAlignment: showCallUsButton
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (showCallUsButton) CallUsButton(),

                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(UIConstants.smallPadding),
                    decoration: BoxDecoration(
                      color: context.colors.greyDark(reverse: true),
                      borderRadius: context.shapes.brXl,
                    ),

                    child: Row(
                      children: [
                        Icon(
                          Icons.language,
                          color: context.colors.primary,
                          size: 22,
                        ),
                        UIConstants.xxsmallWidth,
                        Text(
                          selectedLang.code,
                          style: context.textTheme.titleMedium,
                        ),
                        UIConstants.xxsmallWidth,
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: context.isDarkTheme ? Colors.white : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CallUsButton extends StatelessWidget {
  const CallUsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final isoHint = IsoCode.TR;
        CallUsSheet.show(
          context,
          AppConstants.defaultCompanyNumber,
          isoHint: isoHint,
        );
      },

      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: UIConstants.mediumPadding,
        ),
        child: Container(
          child: AppSvgIcon(
            matchTextDirection: false,
            darkDynamicColor: true,
            assetName: Assets.icons.icHaedphone,
          ),
        ),
      ),
    );
  }
}

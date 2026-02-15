import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/color_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/gen/assets.gen.dart';

import '../../../../../../../core/config/localization/localizations_string_keys.dart';
import 'state/loading.dart';

class OfferBuilder extends StatelessWidget {
  const OfferBuilder({super.key});
  //
  @override
  Widget build(BuildContext context) {
    //return OfferLoadedWidget(offers: MockData.demoOfferList);

    return const ShimerPromoSlider();
  }
}

class EmptyOffers extends StatelessWidget {
  const EmptyOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 140.0,
            height: 140.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlphaOpacity(0.3),
                  blurRadius: 8.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Container(
                width: 116.0,
                height: 116.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // Optional: to ensure it's visible
                ),
                child: AppSvgIcon(
                  assetName: Assets.icons.offersIc,
                  height: 20,
                  width: 20,
                  darkDynamicColor: false,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24.0),

          Text(
            Strings.nothing_to_show.tr(),
            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/mock_data.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/features/intro/presentation/views/onboarding/widgets/boarding_data.dart';

import '../../../../../../core/config/constants/ui_constants.dart';
import 'image_center.dart';

List<Widget> buildOnboardingPages(BuildContext context) {
  return MockData.boardingList.map((item) => buildOnboardingPage(item, context)).toList();
}

Widget buildOnboardingPage(BoardingData item, BuildContext context) {
  final styles = context.textTheme;
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ImageCenter(assetName: item.imageUrl),

      Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                item.title.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.headlineMedium,
              ),
            ),

            UIConstants.bigHeight,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                item.body.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: context.colors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

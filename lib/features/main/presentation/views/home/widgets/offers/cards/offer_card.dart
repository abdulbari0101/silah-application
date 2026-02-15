import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/domain/entities/api/offer_entity.dart';

import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/card_button.dart';
import 'package:silah_app/core/presentation/ui/widget/image/custome_image.dart';

class OfferItemWidget extends StatelessWidget {
  final OfferEntity offer;
  final int itemIndex;
  final void Function()? onTap;

  const OfferItemWidget({super.key, required this.offer, required this.itemIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    final offerTitle = offer.title != null && offer.title!.isNotEmpty
        ? offer.title!
        : Strings.new_offer.tr();

    AppLogger().uiDebug(offer);

    final radius = context.shapes.brMd;
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 8, bottom: 5),
      decoration: BoxDecoration(borderRadius: radius, boxShadow: context.shadowSoft),
      child: CardButton(
        onTap: onTap,
        padding: EdgeInsets.zero,
        color: context.colors.surfaceContainerLow,
        borderRadius: radius,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CustomeImage(
                url: offer.name,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                borderRadius: radius.copyWith(bottomLeft: Radius.zero, bottomRight: Radius.zero),
              ),
            ),
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: context.colors.surfaceContainerLow,
                borderRadius: BorderRadius.only(
                  bottomLeft: radius.bottomLeft,
                  bottomRight: radius.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offerTitle,
                    style: context.textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (offer.desc != null && offer.desc!.isNotEmpty)
                    Text(
                      offer.desc!,
                      style: context.textTheme.labelMedium!.onSurfaceVariant(context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

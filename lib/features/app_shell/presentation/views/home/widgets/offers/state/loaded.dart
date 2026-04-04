import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/domain/entities/api/offer_entity.dart';

import '../cards/offer_card.dart';

class OfferLoadedWidget extends StatelessWidget {
  const OfferLoadedWidget({super.key, required this.offers});
  final List<OfferEntity> offers;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: offers.length,

      options: CarouselOptions(
        disableCenter: true,

        viewportFraction: 0.9,
        enableInfiniteScroll: false,
        enlargeCenterPage: false,
        padEnds: false,

        enlargeFactor: 0.2,
        autoPlayCurve: Curves.fastOutSlowIn,
        // height: AppDimension(context).height / 5,
        onPageChanged: (index, reason) {},
      ),
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return OfferItemWidget(
          itemIndex: itemIndex,
          offer: offers[itemIndex],
          onTap: () {},
        );
      },
    );
  }
}

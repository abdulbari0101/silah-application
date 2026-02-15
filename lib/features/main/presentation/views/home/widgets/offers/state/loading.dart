import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../cards/offer_card_shimer.dart';

class ShimerPromoSlider extends StatelessWidget {
  const ShimerPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      options: CarouselOptions(
        disableCenter: true,

        viewportFraction: 0.9,
        enableInfiniteScroll: false,
        enlargeCenterPage: false,
        padEnds: false,

        enlargeFactor: 0.2,
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return const OfferCardShimer();
      },
    );
  }
}

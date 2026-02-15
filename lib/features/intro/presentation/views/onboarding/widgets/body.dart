import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/overlays/sheets/adaptive_bottom_sheet.dart';
import 'package:silah_app/core/presentation/ui/widget/appbar/custome_screen_header.dart';

import '../../../../../../core/config/constants/mock_data.dart';
import '../../../../../../core/config/localization/language_sheet.dart';
import '../../../../../../gen/assets.gen.dart';
import 'buttom_options.dart';
import 'pages_builder.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = MockData.boardingList.map((item) => buildOnboardingPage(item, context)).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomeScreenHeader(
          showCallUsButton: false,
          svgIcon: Assets.icons.icLanguage,
          onTap: () {
            AdaptiveBottomSheet.show(context: context, builder: (context) => LanguageSheet());
          },
        ),

        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (_, index) => pages[index],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pages.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentIndex == index ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentIndex == index ? context.colors.primary : context.colors.greyDark(),
                borderRadius: context.shapes.brXXl,
              ),
            ),
          ),
        ),
        Column(children: [OnboardingButtons()]),
      ],
    );
  }
}

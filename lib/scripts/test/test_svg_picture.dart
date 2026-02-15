// import 'package:silah/core/config/constants/ui_constants.dart';
// import 'package:silah/core/config/extentions/theme_context_extension.dart';
// import 'package:silah/gen/assets.gen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:silah/core/presentation/widget/icons/app_svg_icon.dart';

// class ServiceItem extends StatelessWidget {
//   String icon;
//   String serviceName;
//   String serviceDesc;
//   bool showArrowNext;
//   final Function()? onItemClicked;
//   Function()? onTap;

//   ServiceItem({
//     super.key,
//     required this.icon,
//     required this.serviceName,
//     required this.serviceDesc,
//     this.showArrowNext = true,
//     this.onItemClicked,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = context.themeColorsWatch;
//     final style = context.themeStylesWatch;

//     return GestureDetector(
//       onTap: onItemClicked,
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: UIConstants.mediumPadding,
//           vertical: UIConstants.mediumPadding,
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             AppSvgIcon(assetName: icon, width: 20, height: 20),
//             UIConstants.bigWidth,
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(serviceName, style: style.darkBlue14),
//                   UIConstants.xsmallHeight,
//                   Text(serviceDesc, style: style.grey12),
//                 ],
//               ),
//             ),
//             UIConstants.bigWidth,
//             Visibility(
//               visible: showArrowNext,
//               child: AppSvgIcon(assetName: Assets.icons.icArrowNext, width: 24,
//                 height: 24),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         AppSvgIcon(assetName: Assets.icons.delete, colorFilter: ColorFilter.mode(
//             context.themeColors.iconColor,
//             BlendMode.srcIn),
//           height: UIConstants.xbigHeight.height,
//           width: 24,
//         ),

//         AppSvgIcon(assetName: Assets.icons.icArrowNext, width: 24, height: 24),

//         IconButton(
//           icon: AppSvgIcon(assetName: _obscure ? Assets.icons.eyeClosed : Assets.icons.eyeOpen, customColorFilter: ColorFilter.mode(colors.iconColor, BlendMode.srcIn),
//           ),
//         ),

//         AppSvgIcon(assetName: Assets.icons.icProfile),

//         AppSvgIcon(assetName: "asset", height: 24, width: 24, color: color),
//       ],
//     );
//   }
// }

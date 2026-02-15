import 'package:flutter/material.dart';

class SubListView {
  final void Function()? onMoreTap;
  final Widget child;
  final String title;
  final String? moreText;
  final String? closeText;
  final bool visibility;


  const SubListView({
    this.onMoreTap,
    required this.child,
    required this.title,
    this.moreText,
    this.visibility= true,

    this.closeText,

  });
}

import 'package:flutter/material.dart';

class LanguageOption {
  final String id;
  final String name;
  final Widget flag; // Widget to allow for Image.asset, SVG, or CircleAvatar

  const LanguageOption({required this.id, required this.name, required this.flag});
}

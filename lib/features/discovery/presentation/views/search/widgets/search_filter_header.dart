import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_search_text_field.dart';

class SearchFilterHeader extends StatelessWidget {
  const SearchFilterHeader({
    super.key,
    required this.controller,
    required this.onChanged,
    this.onCleared,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback? onCleared;

  @override
  Widget build(BuildContext context) {
    return FSearchTextField(
      controller: controller,
      hintText: Strings.search_for_lawyer_or_specialization.tr(),
      onChanged: onChanged,
      onCleared: onCleared,
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/app_language.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/config/theme/roles/typography.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';

class LanguageSheet extends StatelessWidget {
  const LanguageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingBloc, AppSettingState>(
      builder: (context, state) {
        final selectedLang = state.data.language;

        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 24, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Strings.change_language.tr(),
                  style: context.textTheme.titleMedium, // no color override
                  textAlign: TextAlign.center,
                ),
                UIConstants.bigHeight,
                const Divider(), // use themed onSurfaceVariant by default
                UIConstants.smallHeight,
                // ✅ Make the list scrollable so it never overflows
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: AppLanguage.supportedLanguages.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (_, i) {
                      final lang = AppLanguage.supportedLanguages[i];
                      final isSelected = selectedLang.code == lang.code;
                      return _LanguageTile(lang: lang, isSelected: isSelected);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final AppLanguage lang;
  final bool isSelected;

  const _LanguageTile({required this.lang, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    // Background + foreground are the ONLY things that need changing
    final bg = isSelected ? cs.primary : Colors.transparent;
    final fg = isSelected ? cs.onPrimary : theme.textTheme.labelLarge!.color;

    final label = theme.textTheme.labelLarge!;
    final tiny = theme.extension<TinyText>()!.tiny;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(color: bg, borderRadius: context.shapes.brMd),
      child: InkWell(
        borderRadius: context.shapes.brMd,
        onTap: isSelected
            ? null
            : () {
                context.read<AppSettingBloc>().add(
                  ChangeLanguageEvent(language: lang, isRefresh: false, fromWhere: "_LanguageTile"),
                );
              },
        child: DefaultTextStyle.merge(
          // Set fg once for all inner Text unless overridden
          style: label.copyWith(color: fg),
          child: IconTheme.merge(
            data: IconThemeData(color: fg),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.transparent,
                    child: Text(
                      lang.code.toUpperCase(),
                      // use TinyText once; only add what's different
                      style: tiny.copyWith(color: fg, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      lang.name,
                      // Only change what truly differs on selection (weight)
                      style: isSelected
                          ? label.copyWith(color: fg, fontWeight: FontWeight.w700)
                          : label, // relies on default color from DefaultTextStyle
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(scale: animation, child: child),
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, key: ValueKey('selected'))
                        : const SizedBox(width: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

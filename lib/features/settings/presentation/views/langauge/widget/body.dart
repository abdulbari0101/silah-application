import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/app_language.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/gen/assets.gen.dart';

import 'langauge_option.dart';

class LanguageBody extends StatefulWidget {
  const LanguageBody({super.key});

  @override
  State<LanguageBody> createState() => _LanguageBodyState();
}

class _LanguageBodyState extends State<LanguageBody> {
  late String _selectedLanguageId;
  late List<LanguageOption> _languageOptions;

  @override
  void initState() {
    super.initState();

    final currentLang = context.read<AppSettingBloc>().state.data.language;
    _selectedLanguageId = currentLang.code;

    _languageOptions = [
      LanguageOption(
        id: AppLanguage.english.code,
        name: AppLanguage.english.name,
        flag: CircleAvatar(
          radius: 16,
          child: AppSvgIcon(
            assetName: Assets.icons.flags.icUsd,
            darkDynamicColor: false,
          ),
          //backgroundImage: NetworkImage('https://flagcdn.com/w40/gb.png'),
        ),
      ),

      LanguageOption(
        id: AppLanguage.arabic.code,
        name: AppLanguage.arabic.name,
        flag: CircleAvatar(
          radius: 16,

          child: AppSvgIcon(
            assetName: Assets.icons.flags.icAr,
            matchTextDirection: false,
            darkDynamicColor: false,
          ),
          //  backgroundImage: NetworkImage('https://flagcdn.com/w40/sa.png'),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: context.shapes.roundedMd,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _languageOptions.length,
          itemBuilder: (context, index) {
            final language = _languageOptions[index];
            final bool isSelected = language.id == _selectedLanguageId;

            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 8.0,
              ),
              leading: language.flag,
              title: Text(language.name, style: context.textTheme.labelLarge),
              trailing: isSelected
                  ? Icon(Icons.check, color: context.colors.primary, size: 24)
                  : null,
              onTap: () {
                if (!isSelected) {
                  //
                  setState(() {
                    _selectedLanguageId = language.id;
                  });

                  context.read<AppSettingBloc>().add(
                    ChangeLanguageEvent(
                      language: AppLanguage.fromCode(language.id),
                      isRefresh: true,
                      fromWhere: "LanguageBody",
                    ),
                  );
                }
              },
            );
          },
          separatorBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 72.0),
              child: Divider(
                height: 1,
                thickness: 0.5,
                color: context.colors.outlineVariant,
              ),
            );
          },
        ),
      ),
    );
  }
}

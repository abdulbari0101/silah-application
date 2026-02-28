import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/discovery/presentation/blocs/specifications/specifications_bloc.dart';
import 'package:silah_app/features/discovery/presentation/views/specification/widgets/body.dart';

class SpecificationsScreen extends StatelessWidget {
  const SpecificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SpecificationsBloc(repository: locator()),

      child: PlatformScreenWrapper(
        title: Strings.specializations.tr(),
        body: const SpecificationsBody(),
      ),
    );
  }
}

import 'dart:async';

import 'package:silah_app/core/data/local/cache/readers/auth_readers.dart';
import 'package:silah_app/core/data/local/cache/readers/setting_reader.dart';
import 'package:silah_app/core/domain/entities/local/setting/app_setting_entity.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/injection/injection_container.dart' as di;
import 'package:silah_app/core/presentation/state_magment/blocs/app_setting/app_setting_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';

class BootData {
  final int? sesstionTime;
  final AppSettingEntity? appSetting;

  BootData({required this.sesstionTime, required this.appSetting});
}

Future<BootData?> loadAndApplyInitialSettings() async {
  final logger = di.locator<AppLogger>();
  final settingReader = di.locator<SettingReader>();

  final authReader = di.locator<SesstionReader>();
  final appStateBloc = di.locator<AppStateBloc>();
  final settingBloc = di.locator<AppSettingBloc>();

  try {
    final settingFuture = settingReader.appSetting();
    final customerFuture = authReader.customer();

    // Await results
    final settingResult = await settingFuture;
    final customerResult = await customerFuture;
    final int? sesstionTime = 120;

    if (customerResult == null) {
      logger.initInfo("Customer is null", tag: "loadAndApplyInitialCustomer");
    }

    appStateBloc.add(InjectDataBeforeAppStart(customer: customerResult?.toEntity()));
    settingBloc.add(InjectAppSettingEvent(setting: settingResult.toEntity()));
    return BootData(appSetting: settingResult.toEntity(), sesstionTime: sesstionTime);
  } catch (e, stack) {
    di.locator<AppLogger>().initError(e, tag: "loadAndApplyInitialSettings", stack: stack);
  }

  return null;
}

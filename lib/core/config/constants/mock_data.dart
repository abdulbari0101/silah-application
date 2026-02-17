import 'package:easy_localization/easy_localization.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/features/app_shell/presentation/views/onboarding/widgets/boarding_data.dart';

import '../../../gen/assets.gen.dart';

class MockData {
  static List<BoardingData> boardingList = [
    BoardingData(
      title: Strings.platform_overview,
      body: Strings.request_consultations_contact_lawyers_apply_training,
      imageUrl: Assets.images.silahLogo1.path,
    ),
    BoardingData(
      title: Strings.find_right_lawyers_with_ai,
      body: Strings.describe_case_choose_best_lawyer,
      imageUrl: Assets.images.verifiedLite,
    ),
    BoardingData(
      title: Strings.licensed_lawyers,
      body: Strings.manage_consultations_clients_and_training,
      imageUrl: Assets.images.verified,
    ),
  ];
}

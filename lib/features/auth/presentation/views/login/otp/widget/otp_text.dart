import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class OTPText extends StatelessWidget {
  const OTPText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(Strings.verification.tr(), style: context.textTheme.titleMedium),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            Strings.verify_msg_phone.tr(),
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/infrastructure/system/app_info_service.dart';
import 'package:silah_app/core/injection/injection_container.dart';

class VersionWidget extends StatelessWidget {
  const VersionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<Either<Failure, String>>(
        future: locator.get<AppInfoService>().getAppVersion(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          final result = snapshot.data;
          if (result == null) {
            return buildError("No data", context);
          }

          return result.fold(
            (failure) => buildError(failure.message, context),
            (version) => buildData(version, context),
          );
        },
      ),
    );
  }

  buildError(String error, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: UIConstants.mediumPadding,
          ),
          child: Text(error, style: context.textTheme.bodySmall),
        ),
      ],
    );
  }

  buildData(String data, BuildContext context) {
    final ver = data.split(" ");
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: UIConstants.mediumPadding,
          ),
          child: RichText(
            text: TextSpan(
              style: context.textTheme.bodySmall,
              text: "",
              children: [TextSpan(text: ver[0])],
            ),
          ),
        ),
      ],
    );
  }
}

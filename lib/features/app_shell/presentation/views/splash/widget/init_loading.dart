import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';

class InitLoadingWidget extends StatelessWidget {
  const InitLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(bottom: AppDimension(context).height * 0.05),
        child: SpinKitWaveSpinner(color: Colors.white, waveColor: Colors.white, size: 70.0),
      ),
    );
  }
}

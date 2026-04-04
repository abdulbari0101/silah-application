import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/infrastructure/platform/app_platform.dart';

import '../../../../../../../core/presentation/ui/widget/buttons/progress_button.dart';
import '../../../../../../../core/presentation/ui/widget/state_widgets/ios_progress.dart';

class GeneralWebView extends StatefulWidget {
  final String url;
  const GeneralWebView({super.key, required this.url});

  @override
  State<GeneralWebView> createState() => _GeneralWebViewState();
}

class _GeneralWebViewState extends State<GeneralWebView> {
  late String _url;

  late bool isUrl;
  late InAppWebViewController controller;
  int loadingProgress = 0;

  @override
  void initState() {
    _url = widget.url;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildWebView();
  }

  buildWebView() {
    InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      useHybridComposition: true,
      domStorageEnabled: true,

      iframeAllowFullscreen: false,

      transparentBackground: true,
      javaScriptEnabled: true,
      useShouldOverrideUrlLoading: true,
      useOnLoadResource: true,
      verticalScrollBarEnabled: true,
      horizontalScrollBarEnabled: false,
      supportZoom: false,
      preferredContentMode: UserPreferredContentMode.MOBILE,
    );

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              InAppWebView(
                gestureRecognizers: {
                  Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer(),
                  ),
                },
                initialUrlRequest: URLRequest(url: WebUri(_url)),
                initialSettings: settings,
                onProgressChanged: (controller, progress) {
                  setState(() {
                    loadingProgress = progress;
                  });
                },
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  return NavigationActionPolicy.ALLOW;
                },
              ),
              Visibility(
                visible: loadingProgress < 100,
                child: const Align(
                  alignment: Alignment.center,
                  child: AppPlatform(
                    android: ProgressButton(
                      size: UIConstants.buttonHeight * 1.2,
                    ),
                    ios: IOSProgress(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

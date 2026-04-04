import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/infrastructure/platform/app_platform.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/android_progress.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/ios_progress.dart';
import 'package:silah_app/core/presentation/ui/widget/text/section_title.dart';

class AgreementWebView extends StatefulWidget {
  final String url;
  final String title;

  const AgreementWebView({super.key, required this.url, required this.title});

  @override
  State<AgreementWebView> createState() => _InAppWebViewScreenState();
}

class _InAppWebViewScreenState extends State<AgreementWebView> {
  late bool isUrl;
  late InAppWebViewController controller;
  int loadingProgress = 0;

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
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(UIConstants.mediumPadding),
          child: SectionTitle(title: widget.title),
        ),

        Expanded(
          child: Stack(
            children: [
              InAppWebView(
                gestureRecognizers: {
                  Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer(),
                  ),
                },
                initialUrlRequest: URLRequest(url: WebUri(widget.url)),
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
                    android: AndroidProgress(),
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

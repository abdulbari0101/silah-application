import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';

import '../widget/body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // String notificationTag = "notificationTag";
  // String? _token;
  // String? initialMessage;
  // bool _resolved = false;

  // late Stream<String> _tokenStream;

  // void setToken(String? token) {
  //   print('FCM Token: $token');

  //   print("$notificationTag token $token");
  //   context.read<AppSettingBloc>().add(ChangeThemeEvent(
  //         AppSettingState.data.copyWith(token: token),
  //         isRefresh: false,
  //       ));
  //   setState(() {
  //     _token = token;
  //   });
  // }
  // void _handleMessage(RemoteMessage message) {
  //   print("notificationTag message opend ${message.toMap()}");
  // }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    // Defer status bar update until after the first frame

    // FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    // FirebaseMessaging.instance.getInitialMessage().then(
    //       (value) => setState(
    //         () {
    //           print("$notificationTag getInitialMessage $value");
    //           _resolved = true;
    //           initialMessage = value?.data.toString();
    //         },
    //       ),
    //     );

    // FirebaseMessaging.onMessage.listen(showFlutterNotification);

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print("$notificationTag  onMessageOpenedApp ${message.toString()}");
    //   // print('A new onMessageOpenedApp event was published!');
    //   // Navigator.pushNamed(
    //   //   context,
    //   //   '/message',
    //   //   arguments: MessageArguments(message, true),
    //   // );
    // });

    // FirebaseMessaging.instance.getToken().then(setToken);
    // _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    // _tokenStream.listen(setToken);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScreenWrapper(
      iosBackgroundColor: context.colors.primary,
      androidBackgroundColor: context.colors.primary,
      body: const Body(),
    );
  }
}

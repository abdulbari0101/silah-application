import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/infrastructure/platform/app_platform.dart';
import 'package:silah_app/core/presentation/ui/widget/appbar/android_app_bar.dart';

/// A reusable and customizable cross-platform screen widget that adapts layout
/// for both iOS and Android.
///
/// - Provides default app bars when a [title] is supplied and no custom bars are set.
/// - Automatically handles safe areas and input focus dismissal.
class PlatformScreenWrapper extends StatelessWidget {
  /// Main content widget for iOS.
  final Widget? iosBody;

  /// Main content widget for Android.
  final Widget body;

  /// Optional custom AppBar for Android.
  final PreferredSizeWidget? androidAppBar;

  /// Optional custom navigation bar for iOS.
  final ObstructingPreferredSizeWidget? iosNavigationBar;

  /// Optional background color for iOS screen.
  final Color? iosBackgroundColor;

  /// Optional background color for Android screen.
  final Color? androidBackgroundColor;

  /// Controls keyboard insets on iOS.
  final bool iosResizeToAvoidBottomInset;

  /// Controls keyboard insets on Android.
  final bool androidResizeToAvoidBottomInset;

  /// Optional cross-platform title. If set and no custom bars are provided,
  /// default navigation bars are generated.
  final String? title;

  /// Optional Android AppBar actions (only applied if androidAppBar is null and title is not null)
  final List<Widget>? androidActions;

  /// Optional iOS trailing widget (only applied if iosNavigationBar is null and title is not null)
  final Widget? iosTrailing;

  const PlatformScreenWrapper({
    super.key,
    this.iosBody,
    required this.body,
    this.androidAppBar,
    this.iosNavigationBar,
    this.iosBackgroundColor,
    this.androidBackgroundColor,
    this.iosResizeToAvoidBottomInset = true,
    this.androidResizeToAvoidBottomInset = true,
    this.title,
    this.androidActions,
    this.iosTrailing,
  });

  @override
  Widget build(BuildContext context) {
    return AppPlatform(
      ios: _buildIosScaffold(),
      android: _buildAndroidScaffold(),
    );
  }

  Widget _buildIosScaffold() {
    final navBar = iosNavigationBar ?? _buildDefaultIosNavBar();
    return _wrapWithFocusDismiss(
      CupertinoPageScaffold(
        navigationBar: navBar,
        backgroundColor: iosBackgroundColor,
        resizeToAvoidBottomInset: iosResizeToAvoidBottomInset,
        child: SafeArea(child: iosBody ?? body),
      ),
    );
  }

  Widget _buildAndroidScaffold() {
    final appBar = androidAppBar ?? _buildDefaultAndroidAppBar();
    return _wrapWithFocusDismiss(
      Scaffold(
        appBar: appBar,
        backgroundColor: androidBackgroundColor,
        resizeToAvoidBottomInset: androidResizeToAvoidBottomInset,
        body: SafeArea(child: body),
      ),
    );
  }

  CupertinoNavigationBar? _buildDefaultIosNavBar() {
    return title != null
        ? CupertinoNavigationBar(
            middle: Text(title!),
            backgroundColor: iosBackgroundColor,
            trailing: iosTrailing,
          )
        : null;
  }

  AndroidAppBar? _buildDefaultAndroidAppBar() {
    return title != null
        ? AndroidAppBar(
            title: title!,
            backgroundColor: androidBackgroundColor,
            actions: androidActions,
          )
        : null;
  }

  Widget _wrapWithFocusDismiss(Widget child) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}

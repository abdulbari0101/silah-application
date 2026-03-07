import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/network/firestore_display_resolver.dart';
import 'package:silah_app/core/presentation/ui/widget/image/app_remote_avatar.dart';

class ResolvedUserName extends StatefulWidget {
  const ResolvedUserName({
    super.key,
    required this.userId,
    required this.builder,
    this.fallback,
  });

  final String? userId;
  final Widget Function(String value) builder;
  final String? fallback;

  @override
  State<ResolvedUserName> createState() => _ResolvedUserNameState();
}

class _ResolvedUserNameState extends State<ResolvedUserName> {
  late Future<String?> _future;

  @override
  void initState() {
    super.initState();
    _future = FirestoreDisplayResolver.resolveUserName(widget.userId);
  }

  @override
  void didUpdateWidget(covariant ResolvedUserName oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.userId != widget.userId) {
      _future = FirestoreDisplayResolver.resolveUserName(widget.userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final fallback = widget.fallback ?? Strings.user.tr();
    return FutureBuilder<String?>(
      future: _future,
      builder: (context, snapshot) {
        final value = snapshot.data?.trim();
        return widget.builder(
          value != null && value.isNotEmpty ? value : fallback,
        );
      },
    );
  }
}

class ResolvedUserAvatar extends StatefulWidget {
  const ResolvedUserAvatar({
    super.key,
    required this.userId,
    required this.radius,
    this.label,
    this.variant = AppAvatarVariant.user,
  });

  final String? userId;
  final String? label;
  final double radius;
  final AppAvatarVariant variant;

  @override
  State<ResolvedUserAvatar> createState() => _ResolvedUserAvatarState();
}

class _ResolvedUserAvatarState extends State<ResolvedUserAvatar> {
  late Future<String?> _future;

  @override
  void initState() {
    super.initState();
    _future = FirestoreDisplayResolver.resolveUserAvatarUrl(widget.userId);
  }

  @override
  void didUpdateWidget(covariant ResolvedUserAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.userId != widget.userId) {
      _future = FirestoreDisplayResolver.resolveUserAvatarUrl(widget.userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _future,
      builder: (context, snapshot) {
        return AppRemoteAvatar(
          radius: widget.radius,
          imageUrl: snapshot.data,
          label: widget.label,
          variant: widget.variant,
        );
      },
    );
  }
}

class ResolvedSpecializationName extends StatefulWidget {
  const ResolvedSpecializationName({
    super.key,
    required this.specializationId,
    required this.builder,
    this.fallback,
  });

  final String? specializationId;
  final Widget Function(String value) builder;
  final String? fallback;

  @override
  State<ResolvedSpecializationName> createState() =>
      _ResolvedSpecializationNameState();
}

class _ResolvedSpecializationNameState
    extends State<ResolvedSpecializationName> {
  late Future<String?> _future;
  late String _localeCode;

  @override
  void initState() {
    super.initState();
    _localeCode =
        WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    _future = _resolve();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final nextLocaleCode = context.locale.languageCode;
    if (nextLocaleCode != _localeCode) {
      _localeCode = nextLocaleCode;
      _future = _resolve();
    }
  }

  @override
  void didUpdateWidget(covariant ResolvedSpecializationName oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.specializationId != widget.specializationId) {
      _future = _resolve();
    }
  }

  Future<String?> _resolve() {
    return FirestoreDisplayResolver.resolveSpecializationName(
      widget.specializationId,
      localeCode: _localeCode,
    );
  }

  @override
  Widget build(BuildContext context) {
    final fallback = widget.fallback ?? Strings.specializations.tr();
    return FutureBuilder<String?>(
      future: _future,
      builder: (context, snapshot) {
        final value = snapshot.data?.trim();
        return widget.builder(
          value != null && value.isNotEmpty ? value : fallback,
        );
      },
    );
  }
}

class ResolvedSpecializationNames extends StatefulWidget {
  const ResolvedSpecializationNames({
    super.key,
    required this.specializationIds,
    required this.builder,
  });

  final Iterable<String>? specializationIds;
  final Widget Function(List<String> values) builder;

  @override
  State<ResolvedSpecializationNames> createState() =>
      _ResolvedSpecializationNamesState();
}

class _ResolvedSpecializationNamesState
    extends State<ResolvedSpecializationNames> {
  late Future<List<String>> _future;
  late String _localeCode;

  @override
  void initState() {
    super.initState();
    _localeCode =
        WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    _future = _resolve();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final nextLocaleCode = context.locale.languageCode;
    if (nextLocaleCode != _localeCode) {
      _localeCode = nextLocaleCode;
      _future = _resolve();
    }
  }

  @override
  void didUpdateWidget(covariant ResolvedSpecializationNames oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_sameIds(oldWidget.specializationIds, widget.specializationIds)) {
      _future = _resolve();
    }
  }

  Future<List<String>> _resolve() {
    return FirestoreDisplayResolver.resolveSpecializationNames(
      widget.specializationIds,
      localeCode: _localeCode,
    );
  }

  bool _sameIds(Iterable<String>? left, Iterable<String>? right) {
    final leftList = left?.toList() ?? const <String>[];
    final rightList = right?.toList() ?? const <String>[];
    if (leftList.length != rightList.length) {
      return false;
    }
    for (var i = 0; i < leftList.length; i++) {
      if (leftList[i] != rightList[i]) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _future,
      builder: (context, snapshot) {
        return widget.builder(snapshot.data ?? const <String>[]);
      },
    );
  }
}

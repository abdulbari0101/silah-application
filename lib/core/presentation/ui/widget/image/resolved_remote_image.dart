import 'package:flutter/material.dart';
import 'package:silah_app/core/infrastructure/media/firebase_storage_image_url_resolver.dart';

class ResolvedRemoteImage extends StatefulWidget {
  const ResolvedRemoteImage({
    super.key,
    required this.imageUrl,
    required this.builder,
    required this.placeholderBuilder,
  });

  final String? imageUrl;
  final Widget Function(BuildContext context, String resolvedUrl) builder;
  final Widget Function(BuildContext context) placeholderBuilder;

  @override
  State<ResolvedRemoteImage> createState() => _ResolvedRemoteImageState();
}

class _ResolvedRemoteImageState extends State<ResolvedRemoteImage> {
  Future<String?>? _future;
  String? _normalizedUrl;

  @override
  void initState() {
    super.initState();
    _syncFuture();
  }

  @override
  void didUpdateWidget(covariant ResolvedRemoteImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      _syncFuture();
    }
  }

  void _syncFuture() {
    _normalizedUrl = widget.imageUrl?.trim();
    if (FirebaseStorageImageUrlResolver.isGsUrl(_normalizedUrl)) {
      _future = FirebaseStorageImageUrlResolver.resolve(_normalizedUrl);
      return;
    }
    _future = null;
  }

  @override
  Widget build(BuildContext context) {
    if (FirebaseStorageImageUrlResolver.isHttpUrl(_normalizedUrl)) {
      return widget.builder(context, _normalizedUrl!);
    }
    if (_future == null) {
      return widget.placeholderBuilder(context);
    }
    return FutureBuilder<String?>(
      future: _future,
      builder: (context, snapshot) {
        final resolvedUrl = snapshot.data?.trim();
        if (resolvedUrl != null && resolvedUrl.isNotEmpty) {
          return widget.builder(context, resolvedUrl);
        }
        return widget.placeholderBuilder(context);
      },
    );
  }
}

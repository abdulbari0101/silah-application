import 'dart:io';

import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/image/app_remote_icon.dart';

class SpecificationEditorIconPreview extends StatelessWidget {
  const SpecificationEditorIconPreview({
    super.key,
    required this.file,
    required this.url,
  });

  final File? file;
  final String? url;

  @override
  Widget build(BuildContext context) {
    const size = 72.0;
    final icon = context.colors.primary;
    final border = context.colors.outlineVariant.withAlphaOpacity(0.4);
    final imageUrl = url?.trim();

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
        color: context.colors.surface,
      ),
      clipBehavior: Clip.antiAlias,
      child: _buildContent(icon, imageUrl),
    );
  }

  Widget _buildContent(Color icon, String? imageUrl) {
    if (file != null) {
      return Image.file(file!, fit: BoxFit.cover);
    }
    return AppRemoteIcon(
      size: 72,
      imageUrl: imageUrl,
      fit: BoxFit.contain,
      backgroundColor: Colors.transparent,
      fallbackIcon: Icons.image_outlined,
      iconColor: icon,
      borderRadius: BorderRadius.circular(16),
    );
  }
}

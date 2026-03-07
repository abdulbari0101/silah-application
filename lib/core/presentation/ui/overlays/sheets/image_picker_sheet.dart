import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  final ValueChanged<ImageSource> onSelect;

  const ImagePickerBottomSheet({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UIConstants.mediumPadding),
      child: Wrap(
        clipBehavior: Clip.hardEdge,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: Text(Strings.camera_scan.tr()),
            onTap: () => onSelect(ImageSource.camera),
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: Text(Strings.gallery.tr()),
            onTap: () => onSelect(ImageSource.gallery),
          ),
        ],
      ),
    );
  }
}

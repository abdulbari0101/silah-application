import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  final ValueChanged<ImageSource> onSelect;

  const ImagePickerBottomSheet({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    const itemTakePhoto = 'Take a photo';
    return Padding(
      padding: const EdgeInsets.all(UIConstants.mediumPadding),
      child: Wrap(
        clipBehavior: Clip.hardEdge,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text(itemTakePhoto),
            onTap: () => onSelect(ImageSource.camera),
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Pick from gallery'),
            onTap: () => onSelect(ImageSource.gallery),
          ),
        ],
      ),
    );
  }
}

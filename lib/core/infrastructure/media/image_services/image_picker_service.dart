import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:path_provider/path_provider.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImageFromGallery() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  Future<XFile?> captureImageWithCamera() async {
    return await _picker.pickImage(source: ImageSource.camera);
  }

  //============================================//

  static const _fileName = 'profile_image.jpg';

  Future<File?> pickImageWithOutCrop({required ImageSource source}) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 85,
    );
    if (pickedFile == null) return null;
    return File(pickedFile.path);
  }

  Future<File?> pickImage({required ImageSource source}) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 85,
    );
    if (pickedFile == null) return null;
    final File? croppedFile = await _cropImage(File(pickedFile.path));
    return croppedFile;
  }

  Future<File?> _cropImage(File imageFile) async {
    final CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 90,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: Strings.cut_picutre.tr(),
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,

          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: Strings.cut_picutre.tr()),
      ],
    );

    if (cropped == null) return null;
    return File(cropped.path);
  }

  Future<File> saveImageLocally(File imageFile) async {
    final appDir = await getApplicationDocumentsDirectory();
    final savedImage = await imageFile.copy('${appDir.path}/$_fileName');
    return savedImage;
  }

  Future<File?> getStorageSavedImage() async {
    final appDir = await getApplicationDocumentsDirectory();
    final path = '${appDir.path}/$_fileName';
    final file = File(path);
    if (await file.exists()) {
      return file;
    }
    return null;
  }

  Future<void> deleteExistingImageIfExists() async {
    final appDir = await getApplicationDocumentsDirectory();
    final file = File('${appDir.path}/$_fileName');
    if (await file.exists()) {
      await file.delete();
    }
  }

  Future<void> pickQrImageAndProcess(
    BuildContext context,
    Function(File?, String?) onCaptureFromGallery,
  ) async {
    File? imageFile;
    final pickedImage = await pickImageWithOutCrop(source: ImageSource.gallery);
    final scannerController = MobileScannerController();
    if (pickedImage != null) {
      imageFile = pickedImage;

      try {
        final qrData = await scannerController.analyzeImage(pickedImage.path);
        if (qrData != null) {
          final barcode = qrData.barcodes.first;
          final code = barcode.rawValue;
          onCaptureFromGallery(imageFile, code);
        } else {
          onCaptureFromGallery(null, null);
        }
      } catch (e) {
        onCaptureFromGallery(null, null);
        AppLogger().uiError(e, tag: "pickQrImageAndProcess");
      } finally {}
    } else {
      onCaptureFromGallery(null, null);
    }
  }
}

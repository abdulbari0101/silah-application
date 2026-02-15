import 'dart:io';
import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/infrastructure/errors/exceptions.dart';

enum ImageType { NULL, FILE, URL, UINT8LIST }

class ImageUtil {
  static ImageProvider getImageProvider(image) {
    switch (getImageType(image)) {
      case ImageType.NULL:
        throw MissingDataException("Image is Null or not supported");

      case ImageType.FILE:
        return FileImage(image);

      case ImageType.URL:
        return ExtendedImage.network(image).image;

      case ImageType.UINT8LIST:
        return MemoryImage(image);
    }
  }

  static ImageType getImageType(image) {
    if (image is File) {
      return ImageType.FILE;
    }
    if (image is String) {
      return ImageType.URL;
    }
    if (image is Uint8List) {
      return ImageType.UINT8LIST;
    }

    if (image == null) {
      return ImageType.NULL;
    }

    return ImageType.NULL;
  }
}

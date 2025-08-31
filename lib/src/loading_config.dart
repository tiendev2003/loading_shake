import 'package:flutter/material.dart';

/// Cấu hình global cho ảnh mặc định của LoadingAnimation
class LoadingConfig {
  static ImageProvider? background;
  static ImageProvider? item1;
  static ImageProvider? item2;
  static double size = 120; // default size

  static void setDefaults({
    required ImageProvider backgroundImage,
    required ImageProvider item1Image,
    required ImageProvider item2Image,
    double defaultSize = 120,
  }) {
    background = backgroundImage;
    item1 = item1Image;
    item2 = item2Image;
    size = defaultSize;
  }
}

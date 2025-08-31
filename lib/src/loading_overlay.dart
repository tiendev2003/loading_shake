import 'package:flutter/material.dart';
import 'loading_animation.dart';
import 'loading_config.dart';

class LoadingOverlay {
  static OverlayEntry? _overlayEntry;

  static void show(
    BuildContext context, {
    ImageProvider? background,
    ImageProvider? item1,
    ImageProvider? item2,
    double? size,
  }) {
    if (_overlayEntry != null) return;

    final bg = background ?? LoadingConfig.background;
    final i1 = item1 ?? LoadingConfig.item1;
    final i2 = item2 ?? LoadingConfig.item2;
    final sz = size ?? LoadingConfig.size;

    if (bg == null || i1 == null || i2 == null) {
      throw Exception(
          "LoadingOverlay: Missing images. Please set defaults with LoadingConfig.setDefaults or pass images directly.");
    }

    _overlayEntry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),
          Center(
            child: SizedBox(
              width: sz,
              height: sz,
              child: LoadingAnimation(
                backgroundImage: bg,
                item1Image: i1,
                item2Image: i2,
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

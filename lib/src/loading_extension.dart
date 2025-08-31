import 'package:flutter/material.dart';
import 'loading_overlay.dart';

extension LoadingContext on BuildContext {
  void showLoading() {
    LoadingOverlay.show(this);
  }

  void hideLoading() {
    LoadingOverlay.hide();
  }
}

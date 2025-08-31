 

````markdown
# Loading Overlay ✨

[![pub package](https://img.shields.io/pub/v/loading_overlay_flutter.svg)](https://pub.dev/packages/loading_overlay_flutter)

A simple yet powerful **loading overlay widget** for Flutter.  
It allows you to show a **custom loading animation overlay** on top of your app while calling APIs, processing data, or waiting for async operations.

👉 The overlay **disappears automatically when you navigate back** (no need to wait until API finishes).  

---

## 🚀 Features

- Show / hide a fullscreen **loading overlay** easily.
- Support **custom images** (background + item layers).
- Support **custom size** for loading widget.
- Global **config** for default images & size (no need to repeat code).
- **Extension API** for `BuildContext`:  
  ```dart
  context.showLoading();
  context.hideLoading();
````

* Works well with **Navigator back** (overlay removed automatically).

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  loading_overlay_flutter: ^1.0.0
```

Run:

```sh
flutter pub get
```

---

## 🔧 Setup

Before using, set **default configuration** (usually in `main.dart`):

```dart
import 'package:flutter/material.dart';
import 'package:loading_overlay_flutter/loading_overlay_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set global config (images + size)
  LoadingConfig.setDefaults(
    backgroundImage: const AssetImage('assets/items/item1.png'),
    item1Image: const AssetImage('assets/items/item2.png'),
    item2Image: const AssetImage('assets/items/item3.png'),
    size: 120, // default size
  );

  runApp(const MyApp());
}
```

---

## 🖼️ Usage

### Basic usage

```dart
// Show overlay
LoadingOverlay.show(context);

// Hide overlay
LoadingOverlay.hide();
```

### With context extension (recommended)

```dart
// Show
context.showLoading();

// Hide
context.hideLoading();
```

---

## ⚙️ Custom usage

You can override images or size per call:

```dart
LoadingOverlay.show(
  context,
  background: const AssetImage('assets/custom/bg.png'),
  item1: const AssetImage('assets/custom/item1.png'),
  item2: const AssetImage('assets/custom/item2.png'),
  size: 200,
);
```

---

## 🔄 Example

```dart
ElevatedButton(
  onPressed: () async {
    context.showLoading();
    await Future.delayed(const Duration(seconds: 2)); // fake API
    context.hideLoading();
  },
  child: const Text("Show Loading"),
);
```

---
 
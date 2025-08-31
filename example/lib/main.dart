import 'package:flutter/material.dart';
import 'package:loading_shake/loading_shake.dart';
 
void main() {
  LoadingConfig.setDefaults(
    backgroundImage: const AssetImage('assets/items/item1.png'),
    item1Image: const AssetImage('assets/items/item2.png'),
    item2Image: const AssetImage('assets/items/item3.png'),
    defaultSize: 150,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Loading Overlay Demo")),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              context.showLoading();
              Future.delayed(const Duration(seconds: 2), () {
                context.hideLoading();
              });
            },
            child: const Text("Show Loading"),
          ),
        ),
      ),
    );
  }
}

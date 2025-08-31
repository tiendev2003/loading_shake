import 'package:flutter/material.dart';

class LoadingAnimation extends StatefulWidget {
  final ImageProvider backgroundImage;
  final ImageProvider item1Image;
  final ImageProvider item2Image;
  final double size;

  const LoadingAnimation({
    super.key,
    required this.backgroundImage,
    required this.item1Image,
    required this.item2Image,
    this.size = 120.0,
  });

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with TickerProviderStateMixin {
  late AnimationController _item1Controller;
  late AnimationController _item2Controller;

  late Animation<double> _item1Opacity;
  late Animation<double> _item1Shake;

  late Animation<double> _item2Opacity;
  late Animation<double> _item2Shake;

  @override
  void initState() {
    super.initState();

    _item1Controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);

    _item2Controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _item1Opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _item1Controller, curve: Curves.easeInOut),
    );

    _item1Shake = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.1), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 0.1, end: -0.1), weight: 50),
    ]).animate(CurvedAnimation(parent: _item1Controller, curve: Curves.easeInOut));

    _item2Opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _item2Controller, curve: Curves.easeInOut),
    );

    _item2Shake = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.15), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 0.15, end: -0.15), weight: 50),
    ]).animate(CurvedAnimation(parent: _item2Controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _item1Controller.dispose();
    _item2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: widget.backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Item1
          AnimatedBuilder(
            animation: _item1Controller,
            builder: (_, __) => Opacity(
              opacity: _item1Opacity.value,
              child: Transform.rotate(
                angle: _item1Shake.value,
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: widget.item1Image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Item2
          AnimatedBuilder(
            animation: _item2Controller,
            builder: (_, __) => Opacity(
              opacity: _item2Opacity.value,
              child: Transform.rotate(
                angle: _item2Shake.value,
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: widget.item2Image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Text
          const Positioned(
            bottom: -40,
            child: Text(
              "Loading...",
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

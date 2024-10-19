// lib/animation_screen.dart
import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Initialize Tween for left to right movement
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller!);
  }

  @override
  void dispose() {
    _controller?.dispose(); // Clean up
    super.dispose();
  }

  // Function to start or stop the animation
  void _startOrStopAnimation() {
    if (_controller!.isAnimating) {
      _controller!.stop();
    } else {
      _controller!.forward(from: 0); // Start from beginning if stopped
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animation Screen")),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller!,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_animation!.value, 0), // Move horizontally
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startOrStopAnimation,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

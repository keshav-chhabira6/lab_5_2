// lib/home.dart
import 'package:flutter/material.dart';
import 'package:lab_5_2/animation.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Homepage")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AnimationScreen()),
            );
          },
          child: const Text("Go to Animation Screen"),
        ),
      ),
    );
  }
}

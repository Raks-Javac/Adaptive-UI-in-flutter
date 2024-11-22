import 'package:flutter/material.dart';

class SafeAreaWidget extends StatelessWidget {
  const SafeAreaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: FullScreen(),
      ),
    );
  }
}

class FullScreen extends StatelessWidget {
  const FullScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("images/pexels-fabianreitmeier-707915.jpg"),
        const Text(
          "Hello World",
          style: TextStyle(
            fontSize: 20, // Scale text size relative to screen height
          ),
        ),
      ],
    );
  }
}

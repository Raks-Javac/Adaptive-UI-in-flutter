import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: FullScreen(),
      ),
      bottomNavigationBar: HomeBottomNav(),
    );
  }
}

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
        ),
      ],
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

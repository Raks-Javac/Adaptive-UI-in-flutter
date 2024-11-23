import 'package:adaptive_demo/foldable_display_apis.dart';
import 'package:flutter/material.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Photo",
          icon: Icon(Icons.photo),
        ),
        BottomNavigationBarItem(
          label: "Settings",
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("images/pexels-fabianreitmeier-707915.jpg"),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello World",
                style: TextStyle(
                  fontSize: 20, // Scale text size relative to screen height
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Its a wonderful time to be alive",
                style: TextStyle(
                  fontSize: 20, // Scale text size relative to screen height
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

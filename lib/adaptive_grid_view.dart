import 'package:flutter/material.dart';

class GridScreen extends StatelessWidget {
  const GridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 columns for larger screens
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: Column(
                children: [
                  const Image(
                      image: AssetImage(
                          "images/pexels-fabianreitmeier-707915.jpg")),
                  Text("Grid $index"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 60, // Minimum height for each list item
            ),
            child: Card(
              child: Center(
                child: Column(
                  children: [
                    const Image(
                        image: AssetImage(
                            "images/pexels-fabianreitmeier-707915.jpg")),
                    Text("List $index"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ImageHome extends StatelessWidget {
  const ImageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feeds"),
        centerTitle: true,
      ),
      body: const GridScreen(),
    );
  }
}

class GridScreen extends StatelessWidget {
  const GridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns for larger screens
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: const Image(
                image: AssetImage("images/pexels-fabianreitmeier-707915.jpg"),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
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
              minHeight: 70, // Minimum height for each list item
            ),
            child: const Card(
              child: Column(
                children: [
                  Image(
                    image:
                        AssetImage("images/pexels-fabianreitmeier-707915.jpg"),
                    width: double.infinity,
                    height: 230,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:adaptive_demo/adaptive_grid_view.dart';
import 'package:flutter/material.dart';

class MediaQueryDemoView extends StatefulWidget {
  const MediaQueryDemoView({super.key});

  @override
  State<MediaQueryDemoView> createState() => _MediaQueryDemoViewState();
}

class _MediaQueryDemoViewState extends State<MediaQueryDemoView> {
  static const double breakpointWidth =
      600.0; // Define the breakpoint for adaptive navigation.

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final bool isSmallScreen = screenWidth < breakpointWidth;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: Row(
        children: [
          if (!isSmallScreen) // Display NavigationRail for large screens.
            NavigationRail(
              selectedIndex: 0,
              onDestinationSelected: (int index) {
                // Handle navigation changes.
              },
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.photo),
                  label: Text('Photo'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text('Settings'),
                ),
              ],
            ),
          const Expanded(
            child: GridScreen(),
          ),
        ],
      ),
      bottomNavigationBar: isSmallScreen
          ? BottomNavigationBar(
              currentIndex: 0,
              onTap: (int index) {
                // Handle navigation changes.
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.photo),
                  label: 'Photo',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            )
          : null, // Hide BottomNavigationBar for larger screens.
    );
  }
}

class LayoutBuilderDemo extends StatelessWidget {
  const LayoutBuilderDemo({super.key});

  static const double breakpointWidth =
      600.0; // Define the breakpoint for adaptive navigation.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isSmallScreen = constraints.maxWidth < breakpointWidth;

          return Row(
            children: [
              if (!isSmallScreen) // Display NavigationRail for large screens.
                NavigationRail(
                  selectedIndex: 0,
                  onDestinationSelected: (int index) {
                    // Handle navigation changes.
                  },
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.photo),
                      label: Text('Photo'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      label: Text('Settings'),
                    ),
                  ],
                ),
              const Expanded(
                child: GridScreen(),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isSmallScreen = constraints.maxWidth < breakpointWidth;

          return isSmallScreen
              ? BottomNavigationBar(
                  currentIndex: 0,
                  onTap: (int index) {
                    // Handle navigation changes.
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.photo),
                      label: 'Photo',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                )
              : const SizedBox
                  .shrink(); // Hide BottomNavigationBar for larger screens.
        },
      ),
    );
  }
}

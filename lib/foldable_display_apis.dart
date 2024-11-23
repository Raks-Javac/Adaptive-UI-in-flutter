import 'package:adaptive_demo/adaptive_grid_view.dart';
import 'package:flutter/material.dart';

class DisplayAPIDemo extends StatefulWidget {
  const DisplayAPIDemo({super.key});

  @override
  State<DisplayAPIDemo> createState() => _DisplayAPIDemoState();
}

class _DisplayAPIDemoState extends State<DisplayAPIDemo>
    with WidgetsBindingObserver {
  Size? _lastSize; // Tracks the last known screen size.
  static const double breakpointWidth =
      600.0; // Define the breakpoint for adaptive navigation.

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Observes system changes.
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _lastSize = View.of(context).physicalSize; // Get the initial size.
  }

  @override
  void didChangeMetrics() {
    setState(() {
      _lastSize =
          View.of(context).physicalSize; // Update size when metrics change.
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance
        .removeObserver(this); // Remove the observer when disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = (_lastSize?.width ?? breakpointWidth) /
            View.of(context).devicePixelRatio <
        breakpointWidth;

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

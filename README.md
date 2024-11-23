# Crafting Adaptive UI in flutter

This Flutter project demonstrates an **adaptive UI** that dynamically adjusts its layout for different screen sizes using both `MediaQuery` and `LayoutBuilder`. It showcases the use of widgets like `NavigationRail`, `BottomNavigationBar`, and a responsive grid system and also using the Flutter Display API , Safe Area and others to create Adaptable UI generally

---

## Features

- **Adaptive Navigation**: 
  - Uses `NavigationRail` for large screens.
  - Switches to `BottomNavigationBar` for smaller screens.

- **Responsive Grid**: 
  - Adjusts the number of grid columns based on the screen size.

- **Dynamic Layouts**: 
  - Two versions are implemented: one using `MediaQuery` and another using `LayoutBuilder` for responsiveness.

---

## Code Overview

### Key Files

- `main.dart`: Entry point of the Flutter application.
- `DisplayAPIDemo.dart`: Contains the adaptive UI implementation.
- `adaptive_grid_view.dart`: A utility widget to display a responsive grid.

---

## Requirements

- **Flutter SDK**: 3.10.0 or later
- **Dart**: 2.18.0 or later

---

## Setup Instructions

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Raks-Javac/Adaptive-UI-in-flutter
   cd Adaptive-UI-in-flutter
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the App**

   ```bash
   flutter run
   ```

4. **Build for Release** (Optional)

   ```bash
   flutter build apk # For Android
   flutter build ios # For iOS
   ```

---


## Implementation Details

### Using `Flutter Display APIs`

```dart

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

```

## Implementation Details

### Using `MediaQuery`

The `MediaQuery` version determines the screen size using the device's screen width and adjusts the UI layout dynamically.

```dart
final isSmallScreen = MediaQuery.sizeOf(context).width < breakpointWidth;
```

### Using `LayoutBuilder`

The `LayoutBuilder` version calculates the layout constraints based on the widget's available width.

```dart
LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    final isSmallScreen = constraints.maxWidth < breakpointWidth;
    // Adaptive layout logic
  },
);
```

---

## Adaptive Behavior

### Small Screens (< 600px)

- **Navigation**: Uses `BottomNavigationBar`.
- **Content**: Grid adjusts to display fewer columns.

### Large Screens (>= 600px)

- **Navigation**: Uses `NavigationRail`.
- **Content**: Grid adjusts to display more columns.

---

## Screenshots

### Small Screen Example

<img width="319" alt="Screenshot 2024-11-23 at 2 37 18 AM" src="https://github.com/user-attachments/assets/39a60c2c-4392-4119-87bb-8e8c8fe480f9">


### Large Screen Example

<img width="952" alt="Screenshot 2024-11-23 at 2 37 05 AM" src="https://github.com/user-attachments/assets/75e9aff8-4e98-4711-8ce6-b92edeee2225">

---

## Widgets in Use

1. **NavigationRail**: Adaptive navigation for large screens.
2. **BottomNavigationBar**: Simplified navigation for small screens.
3. **GridView**: A responsive grid that adapts column count.
4. **LayoutBuilder**: Used to calculate available width and adjust layout dynamically.
5. **MediaQuery**: An alternative for determining screen size.

---

## How It Works

1. The app observes the width of the screen (or widget constraints).
2. Based on the width:
   - Uses `NavigationRail` for wide screens.
   - Switches to `BottomNavigationBar` for narrow screens.
3. The `GridView` adapts its column count according to the available width.

---

## Code Examples

### Responsive Layout with `LayoutBuilder`

```dart
LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    final isSmallScreen = constraints.maxWidth < breakpointWidth;
    return Row(
      children: [
        if (!isSmallScreen) NavigationRail(/* ... */),
        const Expanded(child: GridScreen()),
      ],
    );
  },
);
```

### Grid Adaptation

```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: isSmallScreen ? 2 : 4,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  ),
  itemBuilder: (context, index) {
    return Card(/* ... */);
  },
);
```

---

## Contributing

1. Fork the repository.
2. Create a new branch:

   ```bash
   git checkout -b feature-name
   ```

3. Commit your changes:

   ```bash
   git commit -m 'Add some feature'
   ```

4. Push to the branch:

   ```bash
   git push origin feature-name
   ```

5. Open a pull request.



import 'package:adaptive_demo/layout_media_q.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // replace the body with anyone you decide to demo
      body: MediaQueryDemoView(),
    );
  }
}

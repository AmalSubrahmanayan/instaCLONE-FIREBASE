import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram_clone/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout(
      {super.key,
      required this.webScreenLayout,
      required this.mobileScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints) {
        if (Constraints.maxWidth > webScreenSize) {
          // Web Screen
          return webScreenLayout;
        }
        return mobileScreenLayout;
        // Mobile Screen
      },
    );
  }
}




import 'package:flutter/cupertino.dart';

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0); // Start at top-left corner

    // Draw a straight line to the top-right corner
    path.lineTo(size.width, 0);

    // Draw a straight line to the bottom-right corner
    path.lineTo(size.width, size.height - 60);

    // Draw a cubic Bézier curve to create the curved bottom
    path.cubicTo(
      size.width * 3 / 4, size.height,
      size.width / 4, size.height,
      0, size.height - 60,
    );

    // Close the path to form a closed shape
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // No need to reclip since the shape is static
  }
}


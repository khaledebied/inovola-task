import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expense_tracker/core/widgets/CachedImage.dart';

class StarBorderCircle extends StatelessWidget {
  final String imageUrl;

  const StarBorderCircle({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(100.h, 100.h), // Size of the container (adjust as needed)
      painter: StarBorderPainter(),
      child: ClipOval(
          child: CachedImage(
        url: imageUrl,
        width: 100.h,
        height: 100.h,
      )),
    );
  }
}

class StarBorderPainter extends CustomPainter {
  StarBorderPainter({this.numStar = 22, this.starSizes = 3});
  int? numStar; // Number of stars around the border
  int? starSizes; // Number of stars around the border

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill; // Fill the stars

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;

    int numStars = numStar!; // Number of stars around the border
    double starSize = starSizes! * pi; // Size of each star (height and width 6π)

    // Loop to draw each star at a specific position
    for (int i = 0; i < numStars; i++) {
      double angle = (i * (360 / numStars)) * (pi / 180); // Evenly distribute stars
      double x = centerX + (radius + starSize / 2) * cos(angle); // Outer radius of the star
      double y = centerY + (radius + starSize / 2) * sin(angle); // Outer radius of the star

      drawStar(canvas, x, y, starSize, paint);
    }
  }

  // Function to draw a filled star at a specific position
  void drawStar(Canvas canvas, double x, double y, double size, Paint paint) {
    final Path path = Path();
    const int points = 5; // 5-point star
    final double outerRadius = size / 2; // Outer radius is 6π / 2
    final double innerRadius = outerRadius / 2.5; // Inner radius (can be adjusted)

    // Calculate points of the star
    for (int i = 0; i < points; i++) {
      double angle = (i * 2 * pi / points) - pi / 2; // Starting at the top
      double outerX = x + outerRadius * cos(angle);
      double outerY = y + outerRadius * sin(angle);

      double innerAngle = angle + pi / points;
      double innerX = x + innerRadius * cos(innerAngle);
      double innerY = y + innerRadius * sin(innerAngle);

      if (i == 0) {
        path.moveTo(outerX, outerY); // Move to the first point of the star
      } else {
        path.lineTo(outerX, outerY);
      }
      path.lineTo(innerX, innerY); // Inner point of the star
    }
    path.close(); // Close the path to form the star shape

    canvas.drawPath(path, paint); // Draw the star with the specified paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

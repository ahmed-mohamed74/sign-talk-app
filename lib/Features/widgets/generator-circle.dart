import 'package:flutter/material.dart';

class GeneratorCircle extends  StatelessWidget {
  final double width;
  final double height;
  const GeneratorCircle({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xff77e6ed),
            Color(0xff77e6ed),
            Color(0xff60d4db),
          ],
        ),
      ),
    );
  }
}

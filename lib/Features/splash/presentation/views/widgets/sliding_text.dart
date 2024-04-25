import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context , _ )
      {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text('Control Everything At Your Fingertips',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: Color(0xff4CB6BD),
            ),
          ),
        );
      },

    );
  }
}
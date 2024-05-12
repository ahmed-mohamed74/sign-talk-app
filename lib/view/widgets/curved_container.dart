import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BottomCurrved.dart';

class CurvedBottomContainer extends StatelessWidget {
  const CurvedBottomContainer({
    super.key,
    required this.press,
    this.icon = Icons.arrow_back_ios,
  });

  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomCurveClipper(),
      child: Container(
        width: double.infinity,
        height: 185,
        color: Theme.of(context).primaryColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: press,
              icon: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MethodItem extends  StatelessWidget {
  const MethodItem({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 63,
      height: 33,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          color:const Color(0x844CB6BD),
        ),
        child:const Center(
          child:
            Text('School',
            style: TextStyle(
              color: Colors.white,
            ),),
          ),
        ),
      );

  }
}



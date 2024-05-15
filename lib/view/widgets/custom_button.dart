import 'package:flutter/material.dart';

class CustomButton extends  StatelessWidget {


   CustomButton({super.key, required this.text,this.onTap});
  final String text;
   void Function()? onTap;
  @override
  Widget build(BuildContext context) {

    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 227,
          height: 37,
          decoration: ShapeDecoration(
            color: const Color(0xFF4CB6BD),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)),
          ),
          child: Align(
            alignment: Alignment.center,
            child:  Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

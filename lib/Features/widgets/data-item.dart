import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  const DataItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          child: Row(
            children: [
              Text('Move 1'),
              Spacer(),
              Icon(
                Icons.settings,
                color: Colors.black54,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Center(
          child: Container(
              width: 456,
              height: 36,
              decoration: ShapeDecoration(
                color: const Color(0xFFF6F6F6),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFACACAC)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Center(
                child: Text(
                  'I want water',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              )),
        )
      ],
    );
  }
}

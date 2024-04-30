import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  const DataItem(
      {super.key,
      required this.innerText,
      required this.upperText,
      required this.color});

  final String innerText;
  final String upperText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                upperText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.settings,
                color: Colors.black54,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Container(
                width: double.infinity,
                height: 55,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF6F6F6),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: color),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    innerText,
                    style: TextStyle(
                      color: color,
                      fontSize: 18,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

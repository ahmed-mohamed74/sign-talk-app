import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

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
                translate(upperText),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              PopupMenuButton<String>(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
                onSelected: (String value) {
                  if (value == 'English') {
                    changeLocale(context, 'en_US');
                  } else if (value == 'Arabic') {
                    changeLocale(context, 'ar');
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'English',
                    child: Text('English'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Arabic',
                    child: Text('Arabic'),
                  ),
                ],
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
                    translate(innerText),
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

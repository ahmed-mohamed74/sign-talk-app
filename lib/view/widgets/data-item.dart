import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sign_talk_app/core/utils/constants.dart';

class DataItem extends StatelessWidget {
  const DataItem({
    super.key,
    required this.innerText,
    required this.upperText,
    required this.color,
    required this.flutterTts,
  });

  final String innerText;
  final String upperText;
  final Color color;
  final flutterTts;

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
                style: TextStyle(
                  color: Theme.of(context).textTheme.titleLarge?.color ??
                      kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () async {
                  // Speak the translated inner text
                  await flutterTts.speak(translate(innerText));
                },
                icon: const Icon(Icons.volume_up),
                color: Theme.of(context).textTheme.titleLarge?.color ??
                    kPrimaryColor,
              ),
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.settings,
                  color: Theme.of(context).textTheme.titleLarge?.color ??
                      kPrimaryColor,
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
          const SizedBox(height: 5),
          Center(
            child: Container(
              width: double.infinity,
              height: 55,
              decoration: ShapeDecoration(
                color: Colors.white,
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
              ),
            ),
          )
        ],
      ),
    );
  }
}

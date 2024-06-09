import 'package:flutter/material.dart';

class SensorController extends ChangeNotifier {
  String gloveText = 'welcome';

  void changeGloveDataText(String recievedText) {
    gloveText = recievedText;
    notifyListeners();
  }
}
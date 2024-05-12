import 'package:flutter/material.dart';

class DataController extends ChangeNotifier {
  String gloveText = 'welcome';
  bool startListenToAPI = false;
  String selectedDrawerPage = 'Home';
  int gloveMode = 0;

  void changeGloveDataText(String recievedText) {
    gloveText = recievedText;
    notifyListeners();
  }

  void changeGloveMode(int index) {
    gloveMode = index;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';

class DataController extends ChangeNotifier {
  String gloveText = 'Welcome';
  bool startListenToAPI = false;

  void changeGloveDataText(String recievedText) {
    gloveText = recievedText;
    notifyListeners();
  }
}

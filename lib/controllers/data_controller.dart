import 'package:flutter/material.dart';

import '../models/mode_model.dart';

class DataController extends ChangeNotifier {
  bool startListenToAPI = false;
  String selectedDrawerPage = 'Home';
  int gloveMode = 0;
  List<Mode>? modesList = [];
  List<String> words = [];

  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  TextEditingController d = TextEditingController();
  TextEditingController e = TextEditingController();
  TextEditingController f = TextEditingController();
  TextEditingController g = TextEditingController();
  TextEditingController h = TextEditingController();
  TextEditingController i = TextEditingController();
  TextEditingController j = TextEditingController();
  TextEditingController k = TextEditingController();
  TextEditingController l = TextEditingController();
  TextEditingController m = TextEditingController();
  TextEditingController n = TextEditingController();

  TextEditingController getFieldController(int index) {
    switch (index) {
      case 0:
        return a;
      case 1:
        return b;
      case 2:
        return c;
      case 3:
        return d;
      case 4:
        return e;
      case 5:
        return f;
      case 6:
        return g;
      case 7:
        return h;
      case 8:
        return i;
      case 9:
        return j;
      case 10:
        return k;
      case 11:
        return l;
      case 12:
        return m;
      case 13:
        return n;

      default:
        return a; // Handle out-of-bounds index (optional)
    }
  }



  void changeGloveMode(int index) {
    gloveMode = index;
    notifyListeners();
  }

  void changeWords(List<Mode>? wordsList) {
    modesList = wordsList;
    notifyListeners();
  }

  Future<List<String>>? Words() async {
    words = [];
    words.add(modesList![gloveMode].a.toString());
    words.add(modesList![gloveMode].b.toString());
    words.add(modesList![gloveMode].c.toString());
    words.add(modesList![gloveMode].d.toString());
    words.add(modesList![gloveMode].e.toString());
    words.add(modesList![gloveMode].f.toString());
    words.add(modesList![gloveMode].g.toString());
    words.add(modesList![gloveMode].h.toString());
    words.add(modesList![gloveMode].i.toString());
    words.add(modesList![gloveMode].j.toString());
    words.add(modesList![gloveMode].k.toString());
    words.add(modesList![gloveMode].l.toString());
    words.add(modesList![gloveMode].m.toString());
    words.add(modesList![gloveMode].n.toString());
    //notifyListeners();
    return words;
  }
  Future<void> fetchData() async {
    // Add your actual data fetching logic here (API calls, database access, etc.)
    // For demonstration, we'll just simulate a 2-second delay
    await Future.delayed(const Duration(milliseconds: 300));
    // Once your data is fetched, update the relevant variables in your controller
    // (e.g., a list of methods)
    notifyListeners(); // This will notify all listening widgets about the change
  }
}

/*
                            [
                              ListTile(
                                leading: Text('1'),
                                title: TextFormField(
                                  controller: controller.a..text = words[0],
                                ),
                              ),
                              ListTile(
                                leading: Text('2'),
                                title: TextFormField(
                                  controller: controller.b..text = words[1],
                                ),
                              ),
                              ListTile(
                                leading: Text('3'),
                                title: TextFormField(
                                  controller: controller.c..text = words[2],
                                ),
                              ),
                              ListTile(
                                leading: Text('4'),
                                title: TextFormField(
                                  controller: controller.d..text = words[3],
                                ),
                              ),
                              ListTile(
                                leading: Text('5'),
                                title: TextFormField(
                                  controller: controller.e..text = words[4],
                                ),
                              ),
                              ListTile(
                                leading: Text('6'),
                                title: TextFormField(
                                  controller: controller.f..text = words[5],
                                ),
                              ),
                              ListTile(
                                leading: Text('7'),
                                title: TextFormField(
                                  controller: controller.g..text = words[6],
                                ),
                              ),
                              ListTile(
                                leading: Text('8'),
                                title: TextFormField(
                                  controller: controller.h..text = words[7],
                                ),
                              ),
                              ListTile(
                                leading: Text('9'),
                                title: TextFormField(
                                  controller: controller.i..text = words[8],
                                ),
                              ),
                              ListTile(
                                leading: Text('10'),
                                title: TextFormField(
                                  controller: controller.j..text = words[9],
                                ),
                              ),
                              ListTile(
                                leading: Text('11'),
                                title: TextFormField(
                                  controller: controller.k..text = words[10],
                                ),
                              ),
                              ListTile(
                                leading: Text('12'),
                                title: TextFormField(
                                  controller: controller.l..text = words[11],
                                ),
                              ),
                              ListTile(
                                leading: Text('13'),
                                title: TextFormField(
                                  controller: controller.m..text = words[12],
                                ),
                              ),
                              ListTile(
                                leading: Text('14'),
                                title: TextFormField(
                                  controller: controller.n..text = words[13],
                                ),
                              ),
                            ]
                            */
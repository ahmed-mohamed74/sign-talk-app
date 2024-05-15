import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/data_controller.dart';
import '../../../core/utils/constants.dart';
import '../../widgets/curved_container.dart';
import '../../widgets/method-item-listview.dart';

class EditGloveModePage extends StatelessWidget {
  const EditGloveModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataController>(
      builder: (context, controller, _) {
        return Scaffold(
          body: Form(
            child: Column(
              children: [
                CurvedBottomContainer(
                  press: () {
                    Navigator.pop(context);
                  },
                ),
                MethodItemListview(
                  controller: controller,
                ),
                SizedBox(
                  height: 470,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: List.generate(
                          words.length,
                          (index) => ListTile(
                            leading: Text(index.toString()),
                            title: TextFormField(initialValue: words[index]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(kPrimaryColor)),
                      child: const Text('Submit'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

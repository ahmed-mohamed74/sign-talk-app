import 'package:flutter/material.dart';
import 'package:sign_talk_app/view/widgets/method-item.dart';
import 'package:sign_talk_app/core/utils/constants.dart';

import '../../controllers/data_controller.dart';
import '../../core/services/api_service.dart';
import '../../models/mode_model.dart';

class MethodItemListview extends StatefulWidget {
  const MethodItemListview({super.key, required this.controller});

  final DataController controller;

  @override
  State<MethodItemListview> createState() => _MethodItemListviewState();
}

class _MethodItemListviewState extends State<MethodItemListview> {
  List<Mode>? modesList = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    _fetchData();
    super.initState();
  }

  Future<void> _fetchData() async {
    setState(() {
      isLoading = true; // Set loading state to true
    });
    try {
      modesList = await ApiService.getModes();
      widget.controller.changeWords(modesList);
    } catch (error) {
      print("Error fetching modes: $error"); // Handle errors
    } finally {
      setState(() {
        isLoading = false; // Set loading state to false after fetching data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          height: 55,
          width: screenWidth * 0.85,
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator()) // Show progress indicator
              : ListView.builder(
                  itemCount: modesList?.length ?? 0, // Handle null case
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: MethodItem(
                        modeText: modesList![index].modeName.toString(),
                        index: index,
                      ),
                    );
                  },
                ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => _showNewModeDialog(context,widget.controller),
        ),
      ],
    );
  }
}

void _showNewModeDialog(BuildContext context,DataController controller) {
  final TextEditingController modeNameController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Enter Mode Name'),
      content: TextField(
        controller: modeNameController,
        decoration: const InputDecoration(hintText: 'Enter mode name'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final modeName = modeNameController.text;
            if (modeName.isNotEmpty) {
              Navigator.pop(context);
              fCreateMode(modeName, context); // Call createMode function
              // Show success message after successful creation (e.g., snackbar)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Mode "$modeName" created successfully!')),
              );
            } else {
              // Show error snackbar if mode name is empty
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter a mode name')),
              );
            }
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

Future<void> fCreateMode(String modeName, context) async {
  try {
    // Assuming DataController provides a way to create a new mode
    final mode = Mode(
      modeName: modeName,
      a: '',
      b: '',
      c: '',
      d: '',
      e: '',
      f: '',
      g: '',
      h: '',
      i: '',
      j: '',
      k: '',
      l: '',
      m: '',
      n: '',
    );

    // Call ApiService to create the new mode on the server
    await ApiService.createMode(mode);

    // Consider refreshing data or reloading the page (optional)
  } catch (error) {
    // Handle errors (e.g., display error message)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error creating mode: $error')),
    );
  }
}

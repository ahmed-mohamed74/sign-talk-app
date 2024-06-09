import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_talk_app/core/services/api_service.dart';
import 'package:sign_talk_app/models/mode_model.dart';

import '../../../controllers/data_controller.dart';
import '../../../core/utils/constants.dart';
import '../../widgets/curved_container.dart';
import '../../widgets/method-item-listview.dart';

class EditGloveModePage extends StatefulWidget {
  const EditGloveModePage({super.key});

  @override
  State<EditGloveModePage> createState() => _EditGloveModePageState();
}

class _EditGloveModePageState extends State<EditGloveModePage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Assuming DataController provides a way to fetch words initially
    Provider.of<DataController>(context, listen: false)
        .Words(); // Fetch words on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataController>(
      builder: (context, controller, _) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CurvedBottomContainer(
                    press: () =>
                        Navigator.pop(context), // Simplified navigation
                  ),
                  MethodItemListview(
                    controller: controller,
                  ),
                  SizedBox(
                    height: 440,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FutureBuilder<List<String>>(
                          future: controller.Words(),
                          // Use controller's wordsFuture
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child:
                                      CircularProgressIndicator()); // Show progress indicator while waiting
                            }

                            if (snapshot.hasError) {
                              return Center(
                                  child: Text(snapshot.error
                                      .toString())); // Handle errors
                            }

                            final words = snapshot.data ??
                                []; // Use empty list if data is null

                            return Column(
                              children: List.generate(
                                words.length
                                    .clamp(0, 14), // Limit to 13 elements
                                (index) => ListTile(
                                  leading: Text('${index + 1}'),
                                  title: TextFormField(
                                    controller:
                                        controller.getFieldController(index)
                                          ..text =
                                              words[index], // Set initial value
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 3.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          // Validate form fields before submitting
                          if (_formKey.currentState!.validate()) {
                            // Show loading indicator
                            setState(() => _isLoading = true);

                            try {
                              // Create Mode object
                              final mode = Mode(
                                modeId: controller
                                    .modesList![controller.gloveMode].modeId,
                                modeName: controller
                                    .modesList![controller.gloveMode].modeName,
                                a: controller.a.text,
                                b: controller.b.text,
                                c: controller.c.text,
                                d: controller.d.text,
                                e: controller.e.text,
                                f: controller.f.text,
                                g: controller.g.text,
                                h: controller.h.text,
                                i: controller.i.text,
                                j: controller.j.text,
                                k: controller.k.text,
                                l: controller.l.text,
                                m: controller.m.text,
                                n: controller.n.text,
                              );

                              // Update mode using ApiService
                              await ApiService.updateMode(mode);

                              // Navigate back and then forward again to reload the page
                              Navigator.pop(
                                  context); // Go back to previous screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EditGloveModePage()),
                              ); // Reload EditGloveModePage
                              // Show success message after successful update (e.g., snackbar)
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Mode ${mode.modeId} updated successfully!')),
                              );
                            } catch (error) {
                              // Handle errors (e.g., display error message)
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('Error updating mode: $error')),
                              );
                            } finally {
                              // Hide loading indicator
                              setState(() => _isLoading = false);
                            }
                          }
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(kPrimaryColor)),
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : const Text('Submit'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          try {
                            _showDeleteModeDialog(
                                context,
                                controller
                                    .modesList![controller.gloveMode].modeId!,
                                controller.modesList![controller.gloveMode]
                                    .modeName!,controller);
                          } catch (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: $error')),
                            );
                          }
                        },
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Colors.red)), // Red color for emphasis
                        child: const Text('Delete'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void _showDeleteModeDialog(BuildContext context, int modeId, String modeName,DataController controller) {
  final TextEditingController modeNameController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Delete Mode'),
      content: Column(
        mainAxisSize: MainAxisSize.min, // Restrict content height
        children: [
          const Text('Enter the mode name to confirm deletion:'),
          TextField(
            controller: modeNameController,
            decoration: const InputDecoration(hintText: 'Mode Name'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final enteredModeName = modeNameController.text;
            if (enteredModeName.isNotEmpty) {
              // Check entered name matches actual mode name
              if (modeName == enteredModeName) {
                Navigator.pop(context);
                controller.changeGloveMode(0);
                _deleteMode(modeId, context); // Call deleteMode function
                Navigator.pop(context); // Go back to previous screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditGloveModePage()),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Mode $modeId deleted successfully')),
                );

              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                          'Entered mode name does not match. Please try again.')),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter the mode name')),
              );
            }
          },
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          child: const Text('Delete'), // Optional: Red color for emphasis
        ),
      ],
    ),
  );
}

void _deleteMode(int modeId, BuildContext context) async {
  await ApiService.deleteMode(modeId);
}

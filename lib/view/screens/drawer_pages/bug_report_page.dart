import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';
import '../../widgets/curved_container.dart';

class BugReportPage extends StatefulWidget {
  const BugReportPage({super.key});

  @override
  _BugReportPageState createState() => _BugReportPageState();
}

class _BugReportPageState extends State<BugReportPage> {
  final _formKey = GlobalKey<FormState>();
  String _description = '';
  String _stepsToReproduce = '';
  String _contactInfo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CurvedBottomContainer(
                press: () => Navigator.pop(context), // Simplified navigation
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Description'),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _description = value!;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Steps to Reproduce'),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the steps to reproduce';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _stepsToReproduce = value!;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Contact Info (Optional)'),
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _contactInfo = value!;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // Handle form submission
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Submitting bug report...')),
                              );
                            }
                          },
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
            ],
          ),
        ),
      ),
    );
  }
}

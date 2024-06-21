import 'package:flutter/material.dart';
import 'package:sign_talk_app/core/utils/constants.dart';

import '../../widgets/curved_container.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(
         backgroundColor: kPrimaryColor,
         foregroundColor: Colors.white,
         elevation: 0,
        title: const Text('Help Center'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/help_center.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
            //height: size.height * 0.25,
          ),
          const SizedBox(
            height: 10,
          ),
          _buildSectionTitle('Contact Us'),
          _buildContactOption(
            icon: Icons.email,
            label: 'Email Us',
            onTap: () {
              _showEmailDialog(context);
            },
          ),
          _buildContactOption(
            icon: Icons.phone,
            label: 'Call Us',
            onTap: () {
              _showPhoneDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Color(0xff87d7d8),
        ),
      ),
    );
  }

  Widget _buildContactOption(
      {required IconData icon,
      required String label,
      required Function() onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: onTap,
    );
  }

  void _showEmailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Contact via Email'),
          content: const Text('0azab6806@gmail.com'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showPhoneDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Contact via Phone'),
          content: const Text('01018517555'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

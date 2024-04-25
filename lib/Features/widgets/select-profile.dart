import 'package:flutter/material.dart';

class SelectProfile  extends StatelessWidget {
  const SelectProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xffFAFAFA),
        elevation: 0,
        leading:const Icon(Icons.arrow_back_ios,color: Colors.black,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/images/Group.png')),
           const SizedBox(height: 5,),
           const Text('Omar Essam',style: TextStyle(fontWeight: FontWeight.bold),),
           const Divider(color: Colors.grey,),
           const SizedBox(height: 5,),
            const Text('Info',style: TextStyle(color: Colors.grey),),
            const SizedBox(height: 5,),
           const ListItem(
                text: 'E-mail',
                icon: Icons.email_rounded,
                mail: 'omaressam@gmail.com'),
           const SizedBox(height: 10,),
            const ListItem(
                text: 'Phone',
                icon: Icons.phone,
                mail: '01018517555'),
           const SizedBox(height: 10,),
            const ListItem(
                text: 'Password',
                icon: Icons.lock,
                mail: 'om12***09yu'),
            
          ],
        ),
      ),
    );
  }
}

class ListItem  extends StatelessWidget {
  const ListItem({super.key, required this.text, required this.icon, required this.mail});
 final String text;
 final IconData icon;
 final String mail;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,style: TextStyle(color: Colors.black),),
       const SizedBox(height: 4,),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color:const Color(0xffE9F4FA),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                // SizedBox(width: 10,),
                 Icon(icon),
               const SizedBox(width: 40,),
                Text(mail,style: TextStyle(fontWeight: FontWeight.bold),),
              const  Spacer(),
              const  Icon(Icons.settings),
                // SizedBox(width: 10,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


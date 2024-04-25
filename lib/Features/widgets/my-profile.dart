import 'package:flutter/material.dart';

class MyProfile  extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xffFAFAFA),
        leading:const Icon(Icons.arrow_back_ios,color: Colors.black,),
        elevation: 0,
        centerTitle: true,
        title: const Text('My Profile',style: TextStyle(color: Colors.black),),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:  ShapeDecoration(
                  shape: RoundedRectangleBorder(
                side:const BorderSide(width: 1,color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
              )),
              child: const ListTile(
                leading: Icon(Icons.person,size: 35,),
                title: Text('Omar Essam',style: TextStyle(color: Colors.black),),
                subtitle: Text('omaressam@gmail.com',style: TextStyle(color: Colors.grey),),
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
              ),
            ),
           const SizedBox(
              height: 5,
            ),
           const Divider(color: Colors.grey,),
            const Text('Setting & Preferences',style: TextStyle(color: Colors.grey),),
           const SizedBox(height: 10,),
            Container(
              width: double.infinity,
             height: 50,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(16),
                 color: Color(0xffE9F4FA),
                 ),
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 12.0),
               child: Row(
                 children:const [
                  // SizedBox(width: 10,),
                    Icon(Icons.notifications),
                   SizedBox(width: 40,),
                   Text('Notifications',style: TextStyle(fontWeight: FontWeight.bold),),
                   Spacer(),
                   Icon(Icons.arrow_forward_ios),
                  // SizedBox(width: 10,),
                 ],
               ),
             ),
             ),
           const SizedBox(height: 10,),
            Container(
              width: double.infinity,
             height: 50,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(16),
                 color: Color(0xffE9F4FA),
                 ),
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 12.0),
               child: Row(
                 children:const [
                  // SizedBox(width: 10,),
                    Icon(Icons.translate_outlined),
                   SizedBox(width: 40,),
                   Text('Language',style: TextStyle(fontWeight: FontWeight.bold),),
                   Spacer(),
                   Icon(Icons.arrow_forward_ios),
                  // SizedBox(width: 10,),
                 ],
               ),
             ),
             ),
           const SizedBox(height: 10,),
           const Divider(color: Colors.grey,),
            const SizedBox(height: 5,),
            const Text('Support' , style: TextStyle(color: Colors.grey),),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffE9F4FA),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children:const [
                    // SizedBox(width: 10,),
                    Icon(Icons.message_outlined),
                    SizedBox(width: 40,),
                    Text('Help Center',style: TextStyle(fontWeight: FontWeight.bold),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                    // SizedBox(width: 10,),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),

            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffE9F4FA),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children:const [
                    // SizedBox(width: 10,),
                    Icon(Icons.flag_outlined),
                    SizedBox(width: 40,),
                    Text('Report A Bug',style: TextStyle(fontWeight: FontWeight.bold),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                    // SizedBox(width: 10,),
                  ],
                ),
              ),
            ),
           const SizedBox(height: 25,),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white70,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children:const [
                    // SizedBox(width: 10,),
                    Icon(Icons.logout,color: Colors.red,),
                    SizedBox(width: 40,),
                    Text('Logout',style: TextStyle(fontWeight: FontWeight.bold),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                    // SizedBox(width: 10,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

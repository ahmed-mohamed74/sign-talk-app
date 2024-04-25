import 'package:flutter/material.dart';

class ChooseLanguage  extends StatelessWidget {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xffFAFAFA),
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios,color:Color(0xFF4CB6BD) ,),
        centerTitle: true,
        title:const Text('Language',style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
         const SizedBox(height: 30,),
          const Center(child: Text('Choose Language',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const [
              FlagItem(image:'assets/images/flag-for-flag-egypt-svgrepo-com 1.png', text: 'English'),
              SizedBox(width: 80,),
              FlagItem(image:'assets/images/flag-for-flag-united-kingdom-svgrepo-com 1.png', text: 'Arabic'),

            ],
          ),

        ],
      ),
    );
  }
}
class FlagItem  extends StatelessWidget {
  const FlagItem({super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        const SizedBox(height: 10,),
        Text(text),
      ],
    );
  }
}

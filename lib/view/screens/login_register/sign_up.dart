import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_talk_app/view/widgets/custom_button.dart';
import 'package:sign_talk_app/core/utils/AppRouter.dart';
import 'dart:ui';
import 'package:sign_talk_app/core/utils/assets.dart';
import 'package:sign_talk_app/core/utils/styles.dart';

import '../../widgets/generator-circle.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 54,
              ),
              Image.asset(
                AssetsData.logo,
                height: 180,
              ),
              const SizedBox(
                height: 56,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const Positioned(
                      left: 220,
                      top: -30,
                      //generator circle//===============
                      child: GeneratorCircle(width: 180, height: 180)
                      //generator circle//===============
                      /*Image.asset(
                      "assets/images/2.PNG",
                    ),*/
                      ),
                  const Positioned(
                    left: 100,
                    top: -30,
                    child: GeneratorCircle(width: 60, height: 60),
                  ),
                  const Positioned(
                    left: 30,
                    top: 350,
                    child: GeneratorCircle(width: 120, height: 120),
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sign Up',
                                style: Styles.style30,
                              ),
                              const SizedBox(height: 20.0),
                              TextFormField(
                                controller: nameController,
                                onChanged: (data) {
                                  nameController.text = data;
                                },
                                validator: (val) => val!.isEmpty
                                    ? 'Please Enter Your Name !'
                                    : null,
                                decoration: const InputDecoration(
                                  labelText: 'Full Name',
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(
                                onChanged: (data) {
                                  emailController.text = data;
                                },
                                controller: emailController,
                                validator: (val) => val!.isEmpty
                                    ? 'Please Enter Your Email !'
                                    : null,
                                decoration: const InputDecoration(
                                  labelText: 'E-mail or Mobile Number',
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(
                                onChanged: (data) {
                                  passwordController.text = data;
                                },
                                controller: passwordController,
                                validator: (val) => val!.isEmpty
                                    ? 'Please Enter Your Password !'
                                    : null,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Password',
                                ),
                              ),
                              const SizedBox(height: 22.0),
                              Text.rich(
                                style: Styles.style10,
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text:
                                          "By Signing up, You’re agree to our ",
                                    ),
                                    TextSpan(
                                      style: const TextStyle(
                                        color: Color(0xFF14DDEF),
                                      ),
                                      text: " Terms & Conditions ",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          //ontap here make action
                                        },
                                    ),
                                    const TextSpan(
                                      text: " and ",
                                    ),
                                    TextSpan(
                                      style: const TextStyle(
                                        color: Color(0xFF14DDEF),
                                      ),
                                      text: " Privacy Policy",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          //ontap here make action
                                        },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              CustomButton(
                                  onTap: () async {
                                    try {
                                      UserCredential user = await FirebaseAuth
                                          .instance
                                          .createUserWithEmailAndPassword(
                                              email: emailController.text.trim(),
                                              password: passwordController.text.trim());
                                      await user.user!.updateDisplayName(
                                          nameController.text.trim());
                                      user = await FirebaseAuth
                                          .instance
                                          .signInWithEmailAndPassword(
                                          email: emailController.text.trim(),
                                          password: passwordController.text.trim());
                                      print(nameController.text.trim());
                                      print(user.user?.displayName??'user');
                                      await GoRouter.of(context).push(
                                          AppRouter.kHomeView,
                                          extra: user);
                                    } on FirebaseAuthException catch (ex) {
                                      if (ex.code == 'weak-password') {
                                        print('weak-password');
                                      } else if (ex.code ==
                                          'email-already-in-use') {
                                        print('email-already-in-use');
                                      } else {
                                        print('error');
                                      }
                                    }
                                  },
                                  text: 'Continue'),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Joined Us Before ?',
                                    style: Styles.style10,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      GoRouter.of(context)
                                          .push(AppRouter.kSignInPage);
                                    },
                                    child: Text(
                                      'Sign In',
                                      style: Styles.style10s,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

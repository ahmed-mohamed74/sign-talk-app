import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_talk_app/view/widgets/custom_button.dart';
import 'package:sign_talk_app/core/utils/AppRouter.dart';
import 'dart:ui';
import 'package:sign_talk_app/core/utils/assets.dart';
import 'package:sign_talk_app/core/utils/styles.dart';

import '../../widgets/generator-circle.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
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
                    top: -40,
                    //generator circle//===============
                    child: GeneratorCircle(width: 180, height: 180),
                    //generator circle//===============
                    /*Image.asset(
                      "assets/images/2.PNG",
                    ),*/
                  ),
                  const Positioned(
                    left: 160,
                    top: 360,
                    child: GeneratorCircle(width: 60, height: 60),
                  ),
                  const Positioned(
                    left: 30,
                    top: 260,
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
                          /* decoration: ShapeDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment(0.85, -0.76),
                              end: Alignment(-0.85, 0.76),
                              colors: [Color(0x66E7E7E7), Color(0x4C8DC9CD)],
                            ),
                            shape: RoundedRectangleBorder(
                              side:
                                  const BorderSide(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),*/
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              TextFormField(
                                onChanged: (data) {
                                  email = data;
                                },
                                controller: emailController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Please Enter Your Email !';
                                  } else if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+$")
                                      .hasMatch(val)) {
                                    return 'Please Enter a Valid Email Address!'; // Improved email validation
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  labelText: 'E-mail or Mobile Number',
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(
                                onChanged: (data) {
                                  password = data;
                                },
                                controller: passwordController,
                                validator: (val) => val!.isEmpty
                                    ? 'Please Enter Your Password !'
                                    : null,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Password',
                                  // Add an error style to show the error message below the field
                                  errorStyle: TextStyle(color: Colors.red),
                                ),
                              ),
                              const SizedBox(height: 22.0),
                              Text(
                                'Forget Password ?',
                                style: Styles.style10s,
                              ),
                              const SizedBox(height: 20.0),
                              GestureDetector(
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      try {
                                        UserCredential user = await FirebaseAuth
                                            .instance
                                            .signInWithEmailAndPassword(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
                                        );
                                        print(user.user!.email);
                                        print(user.user!.displayName);
                                        GoRouter.of(context).pushReplacement(
                                            AppRouter.kHomeView,
                                            extra: user);
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'user-not-found') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    'Email not found. Please try again.')),
                                          );
                                        } else if (e.code == 'wrong-password') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    'Wrong password. Please try again.')),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'Sign in failed: ${e.message}')),
                                          );
                                        }
                                      }
                                    }
                                  },
                                  child: CustomButton(text: 'Sign In')),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Didn’t Joined yet ?',
                                    style: Styles.style10,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      GoRouter.of(context).pushReplacement(
                                          AppRouter.kSignUpPage);
                                    },
                                    child: Text(
                                      'Sign Up',
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

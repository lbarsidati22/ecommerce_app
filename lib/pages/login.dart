import 'package:ecommerce_app/pages/register.dart';
import 'package:ecommerce_app/shared/colors_constans.dart';
import 'package:ecommerce_app/shared/constants.dart';
import 'package:ecommerce_app/shared/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  signIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      showSnackBar(context, 'succes');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      }
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 64,
                ),
                TextFormField(
                  controller: emailController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: decorationTextFiled.copyWith(
                    hintText: 'Enter your email :',
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: decorationTextFiled.copyWith(
                    hintText: 'Enter your password :',
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.all(12),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      bTNgreen,
                    ),
                  ),
                  onPressed: () async {
                    await signIn();
                    if (!mounted) return;
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account ? '),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                      child: const Text('Sign up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

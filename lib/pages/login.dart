import 'package:ecommerce_app/shared/colors_constans.dart';
import 'package:ecommerce_app/shared/constants.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                TextField(
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: decorationTextFiled.copyWith(
                    hintText: 'Enter your email :',
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                TextField(
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
                  onPressed: () {},
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
                        Navigator.pop(context);
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

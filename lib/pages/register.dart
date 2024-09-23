import 'package:ecommerce_app/pages/login.dart';
import 'package:ecommerce_app/shared/colors_constans.dart';
import 'package:ecommerce_app/shared/constants.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
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
                      hintText: 'Enter your nsername :',
                    ),
                  ),
                  const SizedBox(
                    height: 22,
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
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account ? '),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                        child: const Text('Sign in'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

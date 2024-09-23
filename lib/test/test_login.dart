import 'package:ecommerce_app/test/test_register.dart';
import 'package:flutter/material.dart';

class TestLogin extends StatelessWidget {
  const TestLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 43, 43),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: textfailedDecoratins.copyWith(
                    hintText: 'enter your email',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: textfailedDecoratins.copyWith(
                    hintText: 'enter your password',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    backgroundColor: const WidgetStatePropertyAll(
                      Colors.green,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Sign in'),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account ?',
                    ),
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

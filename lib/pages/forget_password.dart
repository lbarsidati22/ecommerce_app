// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce_app/shared/colors_constans.dart';
import 'package:ecommerce_app/shared/snackbar.dart';
import 'package:flutter/material.dart';

import '../shared/constants.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset password',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: appbarGreen,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter your email to rest your password',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                TextFormField(
                  // we return "null" when something is valid
                  validator: (email) {
                    return email!.contains(RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                        ? null
                        : "Enter a valid email";
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  controller: emailController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: decorationTextFiled.copyWith(
                    hintText: 'Enter your email :',
                    suffixIcon: Icon(
                      Icons.mail,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
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
                    if (_formKey.currentState!.validate()) {
                    } else {
                      showSnackBar(context, 'Error');
                    }
                  },
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'Reset password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

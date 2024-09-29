import 'package:ecommerce_app/shared/constants.dart';
import 'package:ecommerce_app/shared/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestForgetPassword extends StatefulWidget {
  const TestForgetPassword({super.key});

  @override
  State<TestForgetPassword> createState() => _TestForgetPasswordState();
}

bool isLeading = false;
final forgetEmailController = TextEditingController();
final formKey = GlobalKey<FormState>();

class _TestForgetPasswordState extends State<TestForgetPassword> {
  restPassword() async {
    setState(() {
      isLeading = true;
    });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgetEmailController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, 'Error : ${e.code}');
    }
    setState(() {
      isLeading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your email to reset your password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 15,
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

                controller: forgetEmailController,
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    restPassword();
                  } else {
                    showSnackBar(context, 'something is rong');
                  }
                },
                child: isLeading
                    ? CircularProgressIndicator()
                    : Text(
                        'Sign in',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

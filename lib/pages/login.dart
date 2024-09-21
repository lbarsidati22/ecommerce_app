import 'package:ecommerce_app/shared/cusstom_text_filed.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 64,
              ),
              MyTextFiled(
                textInputType: TextInputType.emailAddress,
                hinttext: 'Enter your Email :',
                isPassword: false,
              ),
              SizedBox(
                height: 22,
              ),
              MyTextFiled(
                textInputType: TextInputType.text,
                isPassword: true,
                hinttext: 'Enter your Password :',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

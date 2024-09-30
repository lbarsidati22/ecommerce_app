// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:ecommerce_app/pages/register.dart';
import 'package:ecommerce_app/provider/google_sign_in.dart';
import 'package:ecommerce_app/shared/colors_constans.dart';
import 'package:ecommerce_app/shared/constants.dart';
import 'package:ecommerce_app/shared/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'forget_password.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  bool isLoading = false;
  bool showPassword = true;
  final passwordController = TextEditingController();

  signIn() async {
    setState(() {
      isLoading = true;
    });
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      showSnackBar(context, 'succes');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, 'Error : ${e.code}');
    }
    setState(() {
      isLoading = false;
    });
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final googleSignInProvider = Provider.of<GoogleSignInProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text(
          'Sign in',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 64,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: decorationTextFiled.copyWith(
                  hintText: 'Enter your email :',
                  suffixIcon: Icon(
                    Icons.email,
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: showPassword,
                keyboardType: TextInputType.text,
                decoration: decorationTextFiled.copyWith(
                  hintText: 'Enter your password :',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: showPassword
                        ? Icon(
                            Icons.visibility_off,
                          )
                        : Icon(Icons.visibility),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPassword(),
                        ),
                      );
                    },
                    child: Text(
                      'Forget password',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
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
                  await signIn();
                  if (!mounted) return;
                },
                child: isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
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
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 17,
              ),
              SizedBox(
                width: 299,
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.6,
                      color: Colors.purple[900],
                    )),
                    Text(
                      "OR",
                      style: TextStyle(
                        color: Colors.purple[900],
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.6,
                      color: Colors.purple[900],
                    )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        googleSignInProvider.googlelogin();
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.red,
                            )),
                        child: SvgPicture.asset(
                          fit: BoxFit.cover,
                          'assets/icons/google.svg',
                          height: 29,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

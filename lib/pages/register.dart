// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_print, use_build_context_synchronously, sort_child_properties_last

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/pages/login.dart';
import 'package:ecommerce_app/shared/colors_constans.dart';
import 'package:ecommerce_app/shared/constants.dart';
import 'package:ecommerce_app/shared/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool showPassword = true;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final titleController = TextEditingController();
  final ageController = TextEditingController();
  File? imgPath;

  bool isPassword8char = false;
  bool isPasswordhas1number = false;
  bool hasLowercase = false;
  bool specialCharacters = false;
  bool ishasUppercase = false;
  onPasswordChanged(String password) {
    isPassword8char = false;
    isPasswordhas1number = false;
    hasLowercase = false;
    specialCharacters = false;
    ishasUppercase = false;
    setState(() {
      if (password.contains(RegExp(r'.{8,}'))) {
        isPassword8char = true;
      }
      if (password.contains(RegExp(r'[0-9]'))) {
        isPasswordhas1number = true;
      }
      if (password.contains(RegExp(r'[A-Z]'))) {
        ishasUppercase = true;
      }
      if (password.contains(RegExp(r'[a-z]'))) {
        hasLowercase = true;
      }
      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        specialCharacters = true;
      }
    });
  }

  register() async {
    setState(() {
      isLoading = true;
    });
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print(credential.user!.uid);
      CollectionReference users =
          FirebaseFirestore.instance.collection('userss');

      users
          .doc(credential.user!.uid)
          .set(
            {
              'username': userNameController.text,
              'age': ageController.text,
              'title': titleController.text,
              'email': emailController.text,
              'pass': passwordController.text,
            },
            SetOptions(merge: true),
          )
          .then((value) =>
              print("'full_name' & 'age' merged with existing data!"))
          .catchError((error) => print("Failed to merge data: $error"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'The account already exists for that email.');
      } else {
        showSnackBar(context, 'Oops something rong - please try again leter');
      }
    } catch (err) {
      showSnackBar(context, err.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  showButtomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(22),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  await uploadImage2Screen(ImageSource.camera);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 30,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'From Camera',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              GestureDetector(
                onTap: () async {
                  await uploadImage2Screen(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.photo_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'From Galery',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 22),
                  ))
            ],
          ),
        );
      },
    );
  }

  uploadImage2Screen(ImageSource source) async {
    final pickedImg = await ImagePicker().pickImage(source: source);
    try {
      if (pickedImg != null) {
        setState(() {
          imgPath = File(pickedImg.path);
        });
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    ageController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: appbarGreen,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: Stack(
                      children: [
                        imgPath == null
                            ? CircleAvatar(
                                // child: Image.file(imgPath!),
                                backgroundColor: Colors.grey,
                                radius: 75,
                                backgroundImage:
                                    AssetImage('assets/images/avatar.png'),
                              )
                            : ClipOval(
                                child: Image.file(
                                  imgPath!,
                                  width: 145,
                                  height: 145,
                                  fit: BoxFit.cover,
                                ),
                              ),
                        Positioned(
                          left: 100,
                          right: -15,
                          bottom: -10,
                          child: IconButton(
                            onPressed: () {
                              showButtomSheet();
                            },
                            icon: Icon(
                              Icons.add_a_photo,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: userNameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: decorationTextFiled.copyWith(
                      hintText: 'Enter your nsername :',
                      suffixIcon: Icon(
                        Icons.person,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: decorationTextFiled.copyWith(
                      hintText: 'Enter your age :',
                      suffixIcon: Icon(
                        Icons.pest_control_rodent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  TextField(
                    controller: titleController,
                    decoration: decorationTextFiled.copyWith(
                      hintText: 'Enter your title :',
                      suffixIcon: Icon(
                        Icons.person_2_outlined,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
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
                  const SizedBox(
                    height: 22,
                  ),
                  TextFormField(
                    // we return "null" when something is valid
                    onChanged: (password) {
                      onPasswordChanged(password);
                    },
                    validator: (value) {
                      return value!.length < 8
                          ? "Enter at lest 8 chareckter"
                          : null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          icon: Icon(
                            showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 17,
                        ),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isPassword8char ? Colors.green : Colors.white,
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text('At lest 8 chrackter'),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 17,
                        ),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isPasswordhas1number
                              ? Colors.green
                              : Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text('At leste 1 number'),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 17,
                        ),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ishasUppercase ? Colors.green : Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text('Has Uppercase'),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 17,
                        ),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: hasLowercase ? Colors.green : Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text('Has lowercase'),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 17,
                        ),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              specialCharacters ? Colors.green : Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text('Has Spacial Chrackter'),
                    ],
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
                      if (_formKey.currentState!.validate()) {
                        await register();
                        if (!mounted) return;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                        showSnackBar(context, 'Succese');
                      } else {
                        showSnackBar(context, 'Error');
                      }
                    },
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
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

// ignore_for_file: avoid_print, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/test/test_login.dart';
import 'package:ecommerce_app/test/test_shared/test_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show basename;

class TestRegister extends StatefulWidget {
  const TestRegister({super.key});

  @override
  State<TestRegister> createState() => _TestRegisterState();
}

bool testisPassword8char = false;
bool isLoading = false;
bool isShowPassword = true;
final testemailController = TextEditingController();
final testpasswordController = TextEditingController();
final testUserNmaeController = TextEditingController();
final testAgeController = TextEditingController();
final testTitleController = TextEditingController();
final _formKey = GlobalKey<FormState>();
File? imgPath;
String? imgName;

class _TestRegisterState extends State<TestRegister> {
  register() async {
    setState(() {
      isLoading = true;
    });
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: testemailController.text,
        password: testpasswordController.text,
      );
      final storagRef = FirebaseStorage.instance.ref(imgName);
      await storagRef.putFile(imgPath!);
      String url = await storagRef.getDownloadURL();
      CollectionReference users =
          FirebaseFirestore.instance.collection('usersTest');

      users
          .doc(credential.user!.uid)
          .set({
            'imgUrl': url,
            'username': testUserNmaeController.text,
            'age': testAgeController.text,
            'title': testTitleController.text,
            'email': testemailController.text,
            'password': testpasswordController.text,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        testshowSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        testshowSnackBar(context, 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      testshowSnackBar(context, e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  uploadImage2screen(ImageSource source) async {
    final pickedimg = await ImagePicker().pickImage(source: source);
    try {
      if (pickedimg != null) {
        setState(() {
          imgPath = File(pickedimg.path);
          imgName = basename(pickedimg.path);
        });
      } else {
        print('No img selected');
      }
    } catch (e) {
      print('Error => $e');
    }
  }

  testonPasswordchanged(String password) {
    testisPassword8char = false;
    setState(() {
      if (password.contains(RegExp(r'.{8,}'))) {
        testisPassword8char = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2e2b2b),
        title: Text(
          'Register',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 45, 43, 43),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Stack(
                    children: [
                      imgPath == null
                          ? CircleAvatar(
                              radius: 75,
                              backgroundColor: Color(0xff2e2b2b),
                              backgroundImage: AssetImage(
                                'assets/images/user.png',
                              ),
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
                        bottom: -10,
                        left: 99,
                        right: -10,
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    padding: EdgeInsets.all(15),
                                    height: 200,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            await uploadImage2screen(
                                                ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.camera_alt,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'from Camera',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            await uploadImage2screen(
                                                ImageSource.gallery);
                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.grading,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'from Galery',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          icon: Icon(
                            Icons.camera_alt,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: testUserNmaeController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: textfailedDecoratins.copyWith(
                      hintText: 'enter your username',
                      suffixIcon: Icon(
                        Icons.person,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextField(
                    controller: testAgeController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: textfailedDecoratins.copyWith(
                      hintText: 'enter your age',
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextField(
                    controller: testTitleController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: textfailedDecoratins.copyWith(
                      hintText: 'enter your title',
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    validator: (email) {
                      return email!.contains(RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                          ? null
                          : 'enter a valid email';
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: testemailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: textfailedDecoratins.copyWith(
                      hintText: 'enter your email',
                      suffixIcon: Icon(
                        Icons.email,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    onChanged: (password) {
                      testonPasswordchanged(password);
                    },
                    validator: (value) {
                      return value!.length < 8
                          ? 'Enter a last 8 charckter'
                          : null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: testpasswordController,
                    keyboardType: TextInputType.text,
                    obscureText: isShowPassword,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: textfailedDecoratins.copyWith(
                      hintText: 'enter your password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        icon: isShowPassword
                            ? Icon(
                                Icons.visibility,
                              )
                            : Icon(Icons.visibility_off),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          size: 17,
                        ),
                        decoration: BoxDecoration(
                          color:
                              testisPassword8char ? Colors.green : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text('At lest 8 chrackyer'),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          size: 17,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text('has Special Characters'),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          size: 17,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text('has Lowercase'),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          size: 17,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text('has Digits'),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          size: 17,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text('has Uppercase'),
                    ],
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          register();
                        });
                      }
                    },
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text('Sign up'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account ?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TestLogin(),
                            ),
                          );
                        },
                        child: Text('Sign in'),
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

const textfailedDecoratins = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
);

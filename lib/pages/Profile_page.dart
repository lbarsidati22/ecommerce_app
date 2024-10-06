// ignore_for_file: file_names, avoid_print, prefer_const_constructors, use_build_context_synchronously

import 'dart:io';

import 'package:ecommerce_app/shared/colors_constans.dart';
import 'package:ecommerce_app/shared/data_firestore.dart';
import 'package:ecommerce_app/shared/user_imag_firestor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? imgPath;
  uploadImage2Screen() async {
    final pickedImg = await ImagePicker().pickImage(source: ImageSource.camera);
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
  Widget build(BuildContext context) {
    final credential = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: appbarGreen,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: [
          TextButton.icon(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (!mounted) return;
              Navigator.pop(context);
            },
            label: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Stack(
                    children: [
                      imgPath == null
                          ? UserImag()
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
                            uploadImage2Screen();
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Text(
                    'info form firebase auth',
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email : ${credential!.email}',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Created date : ${DateFormat("MMM d, y").format(credential.metadata.creationTime!)}',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Last signed in :  ${DateFormat("MMM d, y").format(credential.metadata.lastSignInTime!)}',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      Colors.red,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      credential.delete();
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    'Delete user',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Text(
                    'info form firebase firestor',
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              GetDataFirestor(
                documentId: credential.uid,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

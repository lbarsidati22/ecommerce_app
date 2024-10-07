// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/test/test_shared/data_firebase.dart';
import 'package:ecommerce_app/test/test_shared/test_user_imag.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' show basename;

class TestProfilePage extends StatefulWidget {
  const TestProfilePage({super.key});

  @override
  State<TestProfilePage> createState() => _TestProfilePageState();
}

File? imgPath;
String? imgName;
CollectionReference users = FirebaseFirestore.instance.collection('usersTest');

class _TestProfilePageState extends State<TestProfilePage> {
  uploadImage2screen() async {
    final pickedimg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
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

  @override
  Widget build(BuildContext context) {
    final credential = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile '),
        actions: [
          Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
                icon: Icon(Icons.login_outlined),
                label: Text('SignOut'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  imgPath == null
                      ? TestUserImag()
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
                      onPressed: () async {
                        await uploadImage2screen();
                        if (imgPath != null) {
                          final storagRef =
                              FirebaseStorage.instance.ref(imgName);
                          await storagRef.putFile(imgPath!);
                          String url = await storagRef.getDownloadURL();
                          users.doc(credential!.uid).update({
                            "imgUrl": url,
                          });
                        }
                      },
                      icon: Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.cyan,
                ),
                child: Text('Get data from firebase'),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email :  ${credential!.email}',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'created at: ${DateFormat(('MMM, y d')).format(credential.metadata.creationTime!)}',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'last Signin: ${DateFormat(('MMM, y d')).format(credential.metadata.lastSignInTime!)}',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
              ],
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.cyan,
                ),
                child: Text('Get data from firestor'),
              ),
            ),
            GetDataFireBase(
              documentId: credential.uid,
            ),
          ],
        ),
      ),
    );
  }
}

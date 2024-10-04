import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDataFirestor extends StatelessWidget {
  final String documentId;

  const GetDataFirestor({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('userss');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 13,
              ),
              Text(
                "username: ${data['username']} ",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                "age: ${data['age']} ",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                "title: ${data['title']} ",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                "email: ${data['email']} ",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                "password: ${data['pass']} ",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          );
        }

        return Text("loading");
      },
    );
  }
}

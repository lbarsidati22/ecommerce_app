import 'package:ecommerce_app/pages/register.dart';
import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'test/test_home.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: TestHome(),
    );
  }
}

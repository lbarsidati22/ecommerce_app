import 'package:ecommerce_app/pages/register.dart';
import 'package:flutter/material.dart';

import 'pages/login.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Register(),
    );
  }
}

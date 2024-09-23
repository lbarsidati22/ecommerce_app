import 'package:ecommerce_app/pages/register.dart';
import 'package:ecommerce_app/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/checkout.dart';
import 'pages/deteals_screan.dart';
import 'pages/home.dart';
import 'test/test_home.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Cart();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const Checkout(),
      ),
    );
  }
}

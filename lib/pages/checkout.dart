import 'package:ecommerce_app/shared/appbar.dart';
import 'package:ecommerce_app/shared/colors_constans.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CheckOut',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: appbarGreen,
        actions: const [
          PrudactAndPrice(),
        ],
      ),
      body: SizedBox(
        height: 300,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.red,
              );
            }),
      ),
    );
  }
}

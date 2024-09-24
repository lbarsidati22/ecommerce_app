// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/pages/checkout.dart';
import 'package:ecommerce_app/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrudactAndPrice extends StatelessWidget {
  const PrudactAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final cartt = Provider.of<Cart>(context);
    return Row(
      children: [
        Stack(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Checkout(),
                    ),
                  );
                },
                icon: const Icon(
                  color: Colors.white,
                  Icons.add_shopping_cart,
                )),
            Positioned(
              top: -3,
              left: 3,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${cartt.itemCounte}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 12,
          ),
          child: Text(
            '\$ ${cartt.price}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

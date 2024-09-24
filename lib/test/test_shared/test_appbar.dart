import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../test_checkout.dart';
import '../test_provider/test_cart.dart';

class TestAppbar extends StatelessWidget {
  const TestAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final testCarti = Provider.of<TestCart>(context);
    return Row(
      children: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contetx) => const TestCheckout(),
                  ),
                );
              },
              icon: const Icon(
                Icons.add_shopping_cart,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Text(
                '${testCarti.testSelectedcart.length}',
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            '\$ ${testCarti.price}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

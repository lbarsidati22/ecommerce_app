// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/provider/cart.dart';
import 'package:ecommerce_app/shared/appbar.dart';
import 'package:ecommerce_app/shared/colors_constans.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final cartt = Provider.of<Cart>(context);
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
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 550,
              child: ListView.builder(
                  itemCount: cartt.selectedPrudact.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(cartt.selectedPrudact[index].name),
                        subtitle: Text(
                            '\$ ${cartt.selectedPrudact[index].price} - ${cartt.selectedPrudact[index].location}'),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(cartt.selectedPrudact[index].imgPath),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            cartt.delete(cartt.selectedPrudact[index]);
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                EdgeInsets.all(12),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              backgroundColor: WidgetStateProperty.all(
                bTNpink,
              ),
            ),
            onPressed: () {},
            child: Text(
              'Pay \$${cartt.price}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce_app/shared/colors_constans.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      color: Colors.white,
                      Icons.add_shopping_cart,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 12,
              ),
              child: Text(
                '\$103',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          backgroundColor: appbarGreen,
          title: Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/pages/checkout.dart';
import 'package:ecommerce_app/pages/deteals_screan.dart';
import 'package:ecommerce_app/provider/cart.dart';
import 'package:ecommerce_app/shared/colors_constans.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/item.dart';
import '../shared/appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final cartt = Provider.of<Cart>(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/backgroundimage.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/images/lbar.jpg"),
                  ),
                  accountName: Text(
                    'Lbar sidati',
                  ),
                  accountEmail: Text(
                    'lbar@gmail.com',
                  ),
                ),
                ListTile(
                  title: const Text('Home'),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('My Prudact'),
                  leading: const Icon(Icons.add_shopping_cart),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Checkout(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('about'),
                  leading: const Icon(
                    Icons.help_center,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('logout'),
                  leading: const Icon(
                    Icons.exit_to_app,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Developed by lbar sidati 2024',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: const [
          PrudactAndPrice(),
        ],
        backgroundColor: appbarGreen,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 22,
            crossAxisSpacing: 22,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetealsScrean(
                      prudact: items[index],
                    ),
                  ),
                );
              },
              child: GridTile(
                footer: GridTileBar(
                  // backgroundColor: Color(0xffcad8d5),
                  trailing: IconButton(
                    onPressed: () {
                      cartt.add(items[index]);
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),

                  leading: const Text('\$ 12.99'),
                  title: const Text(''),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -3,
                      bottom: -9,
                      right: 0,
                      left: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(55),
                        child: Image.asset(items[index].imgPath),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

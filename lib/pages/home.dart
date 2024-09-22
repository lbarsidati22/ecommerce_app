import 'package:ecommerce_app/pages/deteals_screan.dart';
import 'package:ecommerce_app/provider/cart.dart';
import 'package:ecommerce_app/shared/colors_constans.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/item.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
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
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('My Prudact'),
                  leading: Icon(Icons.add_shopping_cart),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('about'),
                  leading: Icon(
                    Icons.help_center,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('logout'),
                  leading: Icon(
                    Icons.exit_to_app,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: [
          Consumer<Cart>(builder: ((context, cartinstence, child) {
            return Row(
              children: [
                Stack(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          color: Colors.white,
                          Icons.add_shopping_cart,
                        )),
                    Positioned(
                      top: -3,
                      left: 3,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          '${cartinstence.selectedPrudact.length}',
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
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 12,
                  ),
                  child: Text(
                    '\$ ${cartinstence.price}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          })),
        ],
        backgroundColor: appbarGreen,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                footer: GridTileBar(
                  // backgroundColor: Color(0xffcad8d5),
                  trailing: Consumer<Cart>(builder: ((context, cartt, child) {
                    return IconButton(
                      onPressed: () {
                        cartt.add(items[index]);
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    );
                  })),
                  leading: Text('\$ 12.99'),
                  title: Text(''),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

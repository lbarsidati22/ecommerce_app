import 'package:ecommerce_app/shared/colors_constans.dart';
import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GridView.builder(
          itemCount: item.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 22,
            crossAxisSpacing: 22,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
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
                        child: Image.asset(item[index].imgPath),
                      ),
                    ),
                  ],
                ),
                footer: GridTileBar(
                  backgroundColor: Color(0xffcad8d5),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
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

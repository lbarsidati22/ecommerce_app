import 'package:ecommerce_app/shared/colors_constans.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
    );
  }
}

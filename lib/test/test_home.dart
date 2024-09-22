import 'package:ecommerce_app/test/test_data.dart/test_prudact.dart';
import 'package:flutter/material.dart';

class TestHome extends StatelessWidget {
  const TestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/backgroundimage.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              accountName: Text('Lbar Sidati'),
              accountEmail: Text('Lbar@gmail.com'),
              currentAccountPicture: CircleAvatar(
                radius: 33,
                backgroundImage: AssetImage('assets/images/lbar.jpg'),
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {},
            ),
            ListTile(
              title: Text('My Prudact'),
              leading: Icon(
                Icons.add_shopping_cart,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.help_center),
              onTap: () {},
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff1c1c22),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_shopping_cart,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                child: const Text('9'),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              '\$ 122',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: myTestList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 22,
            crossAxisCount: 2,
            crossAxisSpacing: 22,
            childAspectRatio: 2.4 / 2,
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
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(33),
                        child: Image.asset(myTestList[index].testImage),
                      ),
                    ),
                  ],
                ),
                footer: GridTileBar(
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                  leading: Text('\$12.89'),
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

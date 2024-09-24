import 'package:ecommerce_app/test/test_checkout.dart';
import 'package:ecommerce_app/test/test_data.dart/test_prudact.dart';
import 'package:ecommerce_app/test/test_provider/test_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'test_details.dart';
import 'test_shared/test_appbar.dart';

class TestHome extends StatelessWidget {
  const TestHome({super.key});

  @override
  Widget build(BuildContext context) {
    final testCarti = Provider.of<TestCart>(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
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
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('My Prudact'),
              leading: const Icon(
                Icons.add_shopping_cart,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TestCheckout(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('About'),
              leading: const Icon(Icons.help_center),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xff1c1c22),
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
        actions: const [
          TestAppbar(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: myTestList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 22,
            crossAxisCount: 2,
            crossAxisSpacing: 22,
            childAspectRatio: 2.4 / 2,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contetx) => TestDetails(
                      detailsPrudact: myTestList[index],
                    ),
                  ),
                );
              },
              child: GridTile(
                footer: GridTileBar(
                  trailing: IconButton(
                    onPressed: () {
                      testCarti.add(myTestList[index]);
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                  leading: const Text(
                    '\$12.89',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  title: const Text(''),
                ),
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
              ),
            );
          },
        ),
      ),
    );
  }
}

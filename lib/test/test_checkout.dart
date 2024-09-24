import 'package:ecommerce_app/test/test_provider/test_cart.dart';
import 'package:ecommerce_app/test/test_shared/test_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestCheckout extends StatelessWidget {
  const TestCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    final testcarti = Provider.of<TestCart>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TestAppbar(),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 550,
            child: ListView.builder(
                itemCount: testcarti.testSelectedcart.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      title:
                          Text('${testcarti.testSelectedcart[index].testname}'),
                      subtitle: Text(
                          '\$${testcarti.testSelectedcart[index].testPrice} - ${testcarti.testSelectedcart[index].testLocation}'),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                          testcarti.testSelectedcart[index].testImage,
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            testcarti.delete(testcarti.testSelectedcart[index]);
                          },
                          icon: Icon(
                            Icons.remove,
                          )),
                    ),
                  );
                }),
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              backgroundColor: const WidgetStatePropertyAll(
                Colors.green,
              ),
            ),
            onPressed: () {},
            child: Text(
              'Pay \$${testcarti.price}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

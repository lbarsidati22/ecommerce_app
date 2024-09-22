import 'package:ecommerce_app/model/item.dart';
import 'package:flutter/material.dart';

import '../shared/colors_constans.dart';

class DetealsScrean extends StatefulWidget {
  Item prudact;
  DetealsScrean({super.key, required this.prudact});

  @override
  State<DetealsScrean> createState() => _DetealsScreanState();
}

class _DetealsScreanState extends State<DetealsScrean> {
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Deteals Screan',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.prudact.imgPath),
            SizedBox(
              height: 12,
            ),
            Text(
              '\$ ${widget.prudact.price}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  child: Text(
                    'New',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 24,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      size: 24,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      size: 24,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      size: 24,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      size: 24,
                      color: Colors.amber,
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.edit_location,
                      size: 25,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.prudact.location,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                'Details :',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              overflow: TextOverflow.fade,
              'Most flowering plants depend on animals, such as bees, moths, and butterflies, to transfer their pollen between different flowers, and have evolved to attract these pollinators by various strategies, including brightly colored, conspicuous petals, attractive scents, and the production of nectar, a food source for pollinators.[1] In this way, many flowering plants have co-evolved with pollinators to be mutually dependent on services they provide to one another—in the plants  a means of reproduction  the pollinatorsa source of food',
              style: TextStyle(
                fontSize: 16,
              ),
              maxLines: isShowMore ? 3 : null,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isShowMore = !isShowMore;
                });
              },
              child: Text(
                isShowMore ? 'Show more' : 'Show less',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

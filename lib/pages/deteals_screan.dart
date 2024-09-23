import 'package:ecommerce_app/model/item.dart';
import 'package:flutter/material.dart';

import '../shared/appbar.dart';
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
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: const [
          PrudactAndPrice(),
        ],
        backgroundColor: appbarGreen,
        title: const Text(
          'Deteals Screan',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.prudact.imgPath),
            const SizedBox(
              height: 12,
            ),
            Text(
              '\$ ${widget.prudact.price}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  child: const Text(
                    'New',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Row(
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
                const Spacer(),
                Row(
                  children: [
                    const Icon(
                      Icons.edit_location,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.prudact.location,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
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
            const SizedBox(
              height: 16,
            ),
            Text(
              overflow: TextOverflow.fade,
              'Most flowering plants depend on animals, such as bees, moths, and butterflies, to transfer their pollen between different flowers, and have evolved to attract these pollinators by various strategies, including brightly colored, conspicuous petals, attractive scents, and the production of nectar, a food source for pollinators.[1] In this way, many flowering plants have co-evolved with pollinators to be mutually dependent on services they provide to one another—in the plants  a means of reproduction  the pollinatorsa source of food',
              style: const TextStyle(
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
                style: const TextStyle(
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

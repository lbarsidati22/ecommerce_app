import 'package:ecommerce_app/test/test_data.dart/test_prudact.dart';
import 'package:ecommerce_app/test/test_provider/test_cart.dart';
import 'package:ecommerce_app/test/test_shared/test_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TestDetails extends StatefulWidget {
  TestDetails({super.key, required this.detailsPrudact});
  TestPrudact detailsPrudact;
  @override
  State<TestDetails> createState() => _TestDetailsState();
}

class _TestDetailsState extends State<TestDetails> {
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details Screen',
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
          TestAppbar(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage(widget.detailsPrudact.testImage),
            ),
            Text(
              '\$ ${widget.detailsPrudact.testPrice}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.red,
                  ),
                  child: const Text('New'),
                ),
                const SizedBox(
                  width: 22,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                const Spacer(),
                const Icon(
                  Icons.edit_location,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.detailsPrudact.testLocation,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Details :',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              overflow: TextOverflow.fade,
              maxLines: isShowMore ? 4 : null,
              'When pollen from the anther of a flower is deposited on the stigma, this is called pollination. Some flowers may self-pollinate, producing seed using pollen from a different flower of the same plant, but others have mechanisms to prevent self-pollination and rely on cross-pollination, when pollen is transferred from the anther of one flower to the stigma of another flower on a different individual of the same species. Self-pollination happens in flowers where the stamen and carpel mature at the same time, and are positioned so that the pollen can land on the flowers stigma. This pollination does not require an investment from the plant to provide nectar and pollen as food for pollinators.[3] Some flowers produce diaspores without fertilization (parthenocarpy). After fertilization, the ovary of the flower develops into fruit containing seeds Flowers have long been appreciated for their beauty and pleasant scents, and also hold cultural significance as religious, ritual, or symbolic objects, or sources of medicine and food',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isShowMore = !isShowMore;
                });
              },
              child: Text(isShowMore ? 'Show More' : 'Show less'),
            ),
          ],
        ),
      ),
    );
  }
}

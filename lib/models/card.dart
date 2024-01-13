import 'package:task_shop_bags/screens/detail_bag.dart';

import '../models/bag_item.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  final BagItem bagItem;
  const CardPage({super.key, required this.bagItem});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => DetailBag(bagItem: widget.bagItem)));
        },
        child: Column(children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey[400],
                ),
                width: 150,
                height: 150,
              ),
              Positioned(
                  top: 25,
                  left: 12.5,
                  right: 12.5,
                  child: Image.network(
                    widget.bagItem.image,
                    height: 100,
                  )),
            ],
          ),
          Column(children: [
            Text(
              widget.bagItem.title,
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              "\$${widget.bagItem.price}",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ]),
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:task_shop_bags/models/animation_controller.dart';
import 'package:task_shop_bags/models/positioned_container.dart';

import '../models/bag_item.dart';

class DetailBag extends StatefulWidget {
  final BagItem bagItem;
  const DetailBag({super.key, required this.bagItem});

  @override
  State<DetailBag> createState() => _DetailBagState();
}

class _DetailBagState extends State<DetailBag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
          backgroundColor: Colors.grey[400],
          title: Row(
            children: [
              const SizedBox(
                width: 200,
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              ),
            ],
          )),
      body: Stack(
        children: [
          PositionedContainer(bagItem: widget.bagItem),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  widget.bagItem.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Office Code',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text(
                        'Price',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      subtitle: Text(
                        "\$${widget.bagItem.price}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Controller(bagItem: widget.bagItem)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'bag_item.dart';

class PositionedContainer extends StatefulWidget {
  final BagItem bagItem;
  const PositionedContainer({super.key, required this.bagItem});

  @override
  State<PositionedContainer> createState() => _PositionedContainerState();
}

class _PositionedContainerState extends State<PositionedContainer> {
  int _counter = 0;

  bool isFilled = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void toggleIcon() {
    setState(() {
      isFilled = !isFilled; // Switch between outline and filled on press
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 260,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        width: 400,
        height: 420,
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text(
                        'Color',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.black),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.red,
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text(
                        'Size',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      subtitle: Text(
                        widget.bagItem.size,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(widget.bagItem.description),
              ),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, right: 8, left: 15, bottom: 8),
                        child: OutlinedButton(
                          onPressed: _decrementCounter,
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 2.0, color: Colors.blue),
                          ),
                          child: const Icon(
                            Icons.remove,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '0' '$_counter',
                        style: const TextStyle(fontSize: 17),
                      ),
                      const SizedBox(width: 5),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 8, left: 15, bottom: 8),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  width: 2.0, color: Colors.blue),
                            ),
                            onPressed: _incrementCounter,
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.grey,
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  IconButton(
                    onPressed: () {
                      toggleIcon();
                    },
                    icon: isFilled
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border_outlined),
                    color: Colors.deepOrange,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 30),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(color: Colors.blue, width: 2)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.blue,
                          )),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'BUY NOW',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task_shop_bags/models/card.dart';
import 'package:http/http.dart' as http;
import 'package:task_shop_bags/screens/search_screen.dart';
import 'dart:convert';

import '../models/bag_item.dart';

class BagsList extends StatefulWidget {
  const BagsList({super.key});

  @override
  State<BagsList> createState() => _BagsListState();
}

class _BagsListState extends State<BagsList> {
  List<BagItem> _bagItems = [];

  void _loadData() async {
    final Uri url = Uri.parse(
        'https://shop-bags-9f9cc-default-rtdb.firebaseio.com/bags-list.json');
    try {
      final http.Response res = await http.get(url);
      final Map<String, dynamic> loadedData = json.decode(res.body);
      final List<BagItem> loadedItems = [];
      // print(loadedItems);
      for (var item in loadedData.entries) {
        // print("object");
        loadedItems.add(
          BagItem(
            id: item.key,
            title: item.value['title'],
            size: item.value['size'],
            description: item.value['description'],
            price: item.value['price'],
            image: item.value['image'],
          ),
        );
        setState(() {
          _bagItems = loadedItems;
        });
      }
      // ignore: empty_catches
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Row(
        children: [
          const Text(
            'Women',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(
            width: 170,
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => const SearchScreen(
                            bagItem: null,
                          )));
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      )),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8.0, crossAxisSpacing: 8.0, crossAxisCount: 2),
          itemCount: _bagItems.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return CardPage(bagItem: _bagItems[index]);
          }),
    );
  }
}

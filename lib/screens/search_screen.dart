import 'package:flutter/material.dart';

import '../models/bag_item.dart';
import '../models/card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.bagItem});
  final BagItem? bagItem;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<BagItem> _dataList = [
    BagItem(
        size: '12 cm',
        id: 'id',
        image: 'https://www.pngmart.com/files/5/Purse-PNG-Picture.png',
        price: 234,
        title: 'Pink luxury bag',
        description:
            'Leather bags are timeless essentials, fusing style with durability, offering sophistication and utility in their design, making them a coveted accessory for any occasion.'),
    BagItem(
        size: '17 cm',
        id: 'id',
        image:
            'https://www.pngmart.com/files/15/Shoulder-Black-Handbag-Leather-PNG.png',
        price: 433,
        title: 'Leather elegance handbag',
        description:
            'Leather bags are timeless essentials, fusing style with durability, offering sophistication and utility in their design, making them a coveted accessory for any occasion.'),
    BagItem(
        size: '24 cm',
        id: 'id',
        image:
            'https://i.pinimg.com/originals/55/90/f8/5590f81c88cc0ef5dad6989e04fe3ddd.png',
        price: 512,
        title: 'Blue handbag',
        description:
            'Leather bags are timeless essentials, fusing style with durability, offering sophistication and utility in their design, making them a coveted accessory for any occasion.'),
    BagItem(
        size: '20 cm',
        id: 'id',
        image:
            'https://www.pngmart.com/files/16/Brown-Leather-Handbag-Transparent-PNG-289x279.png',
        price: 560,
        title: 'Luxury bag',
        description:
            'Leather bags are timeless essentials, fusing style with durability, offering sophistication and utility in their design, making them a coveted accessory for any occasion.'),
    BagItem(
        size: '23 cm',
        id: 'id',
        image:
            'https://www.freepngimg.com/thumb/bag/34521-8-women-bag-transparent.png',
        price: 879,
        title: 'Red handbag',
        description:
            'Leather bags are timeless essentials, fusing style with durability, offering sophistication and utility in their design, making them a coveted accessory for any occasion.'),
    BagItem(
        size: '17 cm',
        id: 'id',
        image:
            'https://d1fzx274w8ulm9.cloudfront.net/73877c7982657d6547f3ad5066520b20.png',
        price: 743,
        title: 'Brown small handbag',
        description:
            'Leather bags are timeless essentials, fusing style with durability, offering sophistication and utility in their design, making them a coveted accessory for any occasion.'),
    BagItem(
        size: '13 cm',
        id: 'id',
        image:
            'https://www.pngall.com/wp-content/uploads/4/Brown-Leather-Bag-PNG-HD-Image.png',
        price: 479,
        title: 'Small shoulder bag',
        description:
            'Leather bags are timeless essentials, fusing style with durability, offering sophistication and utility in their design, making them a coveted accessory for any occasion.'),
    BagItem(
        size: '15 cm',
        id: 'id',
        image:
            'https://static.vecteezy.com/system/resources/previews/013/362/726/non_2x/office-handbag-black-free-png.png',
        price: 990,
        title: 'Luxury black handbag',
        description:
            'Leather bags are timeless essentials, fusing style with durability, offering sophistication and utility in their design, making them a coveted accessory for any occasion.'),
  ];
  final List<BagItem> _filteredDataList = [];

  @override
  void initState() {
    _filteredDataList.addAll(_dataList);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<BagItem> searchList = [];
    searchList.addAll(_dataList);
    if (query.isNotEmpty) {
      List<BagItem> filteredList = [];
      for (var item in searchList) {
        if (query.isNotEmpty) {
          List<BagItem> filteredList = _dataList.where((item) {
            return item.title.toLowerCase().contains(query.toLowerCase());
          }).toList();

          setState(() {
            _filteredDataList.clear();
            _filteredDataList.addAll(filteredList);
          });
        } else {
          setState(() {
            _filteredDataList.clear();
            _filteredDataList.addAll(filteredList);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) {
            filterSearchResults(value);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _filteredDataList.isNotEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                            crossAxisCount: 2),
                    itemCount: _filteredDataList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return CardPage(bagItem: _filteredDataList[index]);
                    })
                : const Center(
                    child: Text('No results found'),
                  ),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tax_keeper/data/dummy_data.dart';
import 'package:tax_keeper/models/item.dart';
import 'package:http/http.dart' as http;
import 'package:tax_keeper/utils/constants.dart';

class ItemsProvider with ChangeNotifier {
  List<Item> _items = dummyItems;

  List<Item> get items {
    return [..._items];
  }

  Future<void> saveItem(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final item = Item(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      ncm: data['ncm'] as String,
      imageUrl: data['imageUrl'] as String,
    );

    return addItem(item);
  }

  Future<void> addItem(Item item) async {
    final response = await http.post(
      Uri.parse('${Constants.ITEM_BASE_URL}.json'),
      body: jsonEncode({
        "name": item.name,
        "ncm": item.ncm,
        "imageUrl": item.imageUrl,
      }),
    );

    final id = jsonDecode(response.body)['name'];

    _items.add(
      Item(id: id, name: item.name, ncm: item.ncm, imageUrl: item.imageUrl),
    );

    notifyListeners();
  }
}

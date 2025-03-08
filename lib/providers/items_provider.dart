import 'package:flutter/material.dart';
import 'package:tax_keeper/data/dummy_data.dart';
import 'package:tax_keeper/models/item.dart';

class ItemsProvider with ChangeNotifier {
  List<Item> _items = dummyItems;

  List<Item> get items {
    return [..._items];
  }
}

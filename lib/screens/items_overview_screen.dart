import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tax_keeper/components/app_drawer.dart';
import 'package:tax_keeper/components/item_grid.dart';
import 'package:tax_keeper/providers/items_provider.dart';

class ItemsOverviewScreen extends StatefulWidget {
  const ItemsOverviewScreen({super.key});

  @override
  State<ItemsOverviewScreen> createState() => _ItemsOverviewScreenState();
}

class _ItemsOverviewScreenState extends State<ItemsOverviewScreen> {
  @override
  void initState() {
    super.initState();
    try {
      Provider.of<ItemsProvider>(context, listen: false).loadProducts();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TaxKeeper')),
      drawer: AppDrawer(),
      body: ItemGrid(),
    );
  }
}

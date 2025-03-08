import 'package:flutter/material.dart';
import 'package:tax_keeper/components/item_grid.dart';

class ItemsOverviewScreen extends StatelessWidget {
  const ItemsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TaxKeeper'),
      ),
      body: ItemGrid(),
    );
  }
}

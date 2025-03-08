import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tax_keeper/components/item_grid_component.dart';
import 'package:tax_keeper/models/item.dart';
import 'package:tax_keeper/providers/items_provider.dart';

class ItemGrid extends StatelessWidget {
  const ItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemsProvider>(context);
    final List<Item> itemList = provider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: itemList.length, // Adicionando itemCount
      itemBuilder: (ctx, index) {
        return ItemGridComponent(itemList[index]);
      },
    );
  }
}

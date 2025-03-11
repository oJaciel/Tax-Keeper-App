import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tax_keeper/components/app_drawer.dart';
import 'package:tax_keeper/components/item_screen_component.dart';
import 'package:tax_keeper/models/item.dart';
import 'package:tax_keeper/providers/items_provider.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = Provider.of<ItemsProvider>(context).items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Itens'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, i) {
            return Column(children: [ItemScreenComponent(items[i]), Divider()]);
          },
        ),
      ),
    );
  }
}

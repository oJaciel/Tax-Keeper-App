import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tax_keeper/models/item.dart';
import 'package:tax_keeper/providers/items_provider.dart';
import 'package:tax_keeper/utils/app_routes.dart';

class ItemScreenComponent extends StatelessWidget {
  final Item item;

  const ItemScreenComponent(this.item);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(item.imageUrl)),
      title: Text(item.name),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.ITEM_FORM, arguments: item);
              },
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                Provider.of<ItemsProvider>(
                  context,
                  listen: false,
                ).removeItem(item);
              },
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

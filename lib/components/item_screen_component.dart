import 'package:flutter/material.dart';
import 'package:tax_keeper/models/item.dart';

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
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(
              onPressed: () {},
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

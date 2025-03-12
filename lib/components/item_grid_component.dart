import 'package:flutter/material.dart';
import 'package:tax_keeper/models/item.dart';
import 'package:tax_keeper/utils/app_routes.dart';

class ItemGridComponent extends StatelessWidget {
  final Item item;

  ItemGridComponent(this.item);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: GestureDetector(
        child: GridTile(
          footer: GridTileBar(
            title: Text(item.name),
            backgroundColor: Colors.black87,
          ),
          child: Image.network(
            item.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (
              BuildContext context,
              Object exception,
              StackTrace? stackTrace,
            ) {
              return Image.network(item.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(color: Colors.black26, child: Icon(Icons.image_not_supported, size: 100, color: Colors.grey)),
              );
            },
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.ITEM_DETAIL, arguments: item);
        },
      ),
    );
  }
}

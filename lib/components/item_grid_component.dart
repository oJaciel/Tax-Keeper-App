import 'package:flutter/material.dart';
import 'package:tax_keeper/models/item.dart';

class ItemGridComponent extends StatelessWidget {
  final Item item;

  ItemGridComponent(this.item);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: GridTile(
        footer: GridTileBar(
          title: Text(item.name),
          backgroundColor: Colors.black87,
        ),
        child: GestureDetector(
          child: Image.network(
            item.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (
              BuildContext context,
              Object exception,
              StackTrace? stackTrace,
            ) {
              return Image.network(
                'https://png.pngtree.com/png-vector/20221125/ourmid/pngtree-no-image-available-icon-flatvector-illustration-picture-coming-creative-vector-png-image_40968940.jpg',
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tax_keeper/models/item.dart';

class ItemGridComponent extends StatelessWidget {
  final Item item;

  ItemGridComponent(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("NCM: ${item.ncm}"),
              Text("ICMS: ${item.aliquotaIcms}%"),
            ],
          ),
        );
  }
}

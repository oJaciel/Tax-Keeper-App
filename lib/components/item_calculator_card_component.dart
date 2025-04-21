import 'package:flutter/material.dart';
import 'package:tax_keeper/components/image_circle_avatar_component.dart';
import 'package:tax_keeper/models/item.dart';

class ItemCalculatorCardComponent extends StatelessWidget {
  const ItemCalculatorCardComponent({super.key, required this.item});

  final Item? item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            item != null
                ? 'Calculando Impostos do item'
                : 'Sem dados do item, favor informar as alíquotas manualmente',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          subtitle:
              item != null
                  ? Text(
                    item!.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                  : null,
          leading: item != null ? ImageCircleAvatarComponent(item: item, size: 25,) : null,
        ),
      ),
    );
  }
}

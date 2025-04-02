import 'package:flutter/material.dart';
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
          leading:
              item != null
                  ? CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black26,
                    child: ClipOval(
                      child: Image.network(
                        item!.imageUrl,
                        fit:
                            BoxFit
                                .cover, // Garante que a imagem cubra o círculo
                        width: double.infinity,
                        height: double.infinity,
                        errorBuilder:
                            (context, error, stackTrace) => Icon(
                              Icons.image_not_supported,
                              size: 25,
                              color: Colors.grey,
                            ),
                      ),
                    ),
                  )
                  : null,
        ),
      ),
    );
  }
}

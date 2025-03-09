import 'package:flutter/material.dart';
import 'package:tax_keeper/models/item.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(item.imageUrl, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Column(
                children: [
                  Text(item.name, style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),),
                  Text('NCM: ${item.ncm}'),
                  Text('CEST: ${item.cest}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

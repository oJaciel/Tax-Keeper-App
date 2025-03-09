import 'package:flutter/material.dart';
import 'package:tax_keeper/components/app_drawer.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Itens'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('N/A'),
      ),
    );
  }
}
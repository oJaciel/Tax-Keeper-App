import 'package:flutter/material.dart';
import 'package:tax_keeper/components/app_drawer.dart';

class NcmScreen extends StatelessWidget {
  const NcmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de NCM'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Text('Nada aqui')
        ],
      ),
    );
  }
}

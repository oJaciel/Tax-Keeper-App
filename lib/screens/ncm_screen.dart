import 'package:flutter/material.dart';
import 'package:tax_keeper/components/app_drawer.dart';
import 'package:tax_keeper/components/ncm_item_card_component.dart';

class NcmScreen extends StatefulWidget {
  const NcmScreen({super.key});

  @override
  State<NcmScreen> createState() => _NcmScreenState();
}

class _NcmScreenState extends State<NcmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consulta de NCM')),
      drawer: AppDrawer(),
      body: Column(children: [NcmItemCardComponent(), Divider(),]),
    );
  }
}

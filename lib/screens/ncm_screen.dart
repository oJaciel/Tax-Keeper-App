import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tax_keeper/components/app_drawer.dart';
import 'package:tax_keeper/models/item.dart';
import 'package:tax_keeper/providers/items_provider.dart';
import 'package:tax_keeper/providers/ncm_provider.dart';

class NcmScreen extends StatefulWidget {
  const NcmScreen({super.key});

  @override
  State<NcmScreen> createState() => _NcmScreenState();
}

class _NcmScreenState extends State<NcmScreen> {
  bool _isInit = true;
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final items = Provider.of<ItemsProvider>(context, listen: false).items;

      Future.microtask(() {
        Provider.of<NcmProvider>(context, listen: false).loadItemsNcm(items);
      });

      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NcmProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Consulta de NCM')),
      drawer: AppDrawer(),
      body: Column(
        children: [
          provider.ncm_list.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                child: ListView.builder(
                  itemCount: provider.ncm_list.length,
                  itemBuilder: (context, index) {
                    final Item item = provider.ncm_list[index]['item'] ?? '';
                    return ListTile(
                      
                      title: Text(item.name),
                      subtitle: Text('${provider.ncm_list[index]['codigo'] ?? ''} - ${provider.ncm_list[index]['descricao'] ?? ''}'),
                    );
                  },
                ),
              ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tax_keeper/components/app_drawer.dart';
import 'package:tax_keeper/providers/ncm_provider.dart';

class NcmScreen extends StatelessWidget {
  const NcmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ncmProvider = Provider.of<NcmProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Consulta de NCM')),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: ncmProvider.loadNcm(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return Consumer<NcmProvider>(
            builder: (ctx, provider, _) {
              final list = provider.ncm_list;

              if (list.isEmpty) {
                return const Center(child: Text('Nenhum NCM encontrado.'));
              }

              return ListView.builder(
                itemCount: list.length,
                itemBuilder:
                    (ctx, i) => ListTile(
                      title: Text(list[i]['codigo'] ?? ''),
                      subtitle: Text(list[i]['descricao'] ?? ''),
                    ),
              );
            },
          );
        },
      ),
    );
  }
}

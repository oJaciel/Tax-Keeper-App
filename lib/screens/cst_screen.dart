import 'package:flutter/material.dart';
import 'package:tax_keeper/components/app_drawer.dart';
import 'package:tax_keeper/data/cst_data.dart';

class CstScreen extends StatefulWidget {
  const CstScreen({super.key});

  @override
  State<CstScreen> createState() => _CstScreenState();
}

class _CstScreenState extends State<CstScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text('Assistente de Consulta CST'),
          bottom: TabBar(tabs: [
            Tab(text: 'ICMS'),
            Tab(text: 'PIS / COFINS',),
            Tab(text: 'IPI',)
          ]),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _buildCard(
                  'Tabela A - Origem da Mercadoria ou Serviço',
                  cstIcmsA,
                  context,
                ),
                const SizedBox(height: 10),
                _buildCard('Tabela B - Tributação pelo ICMS', cstIcmsB, context),
              ],
            ),
          ),
          SingleChildScrollView(
            child: _buildCard('Tabela CST PIS / COFINS', cstPisCofins, context),
          ),
          SingleChildScrollView(
            child: _buildCard('Tabela CST IPI', cstIpi, context),
          )
        ]),
      ),
    );
  }

  Widget _buildCard(
    String title,
    List<Map<String, String>> data,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              ...data
                  .map(
                    (item) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 14,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Text(
                                    item['cod']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(child: Text(item['desc']!)),
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
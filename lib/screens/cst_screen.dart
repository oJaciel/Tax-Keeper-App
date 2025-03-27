import 'package:flutter/material.dart';
import 'package:tax_keeper/components/app_drawer.dart';
import 'package:tax_keeper/components/cst_card_component.dart';
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
          bottom: TabBar(
            tabs: [
              Tab(text: 'ICMS'),
              Tab(text: 'PIS / COFINS'),
              Tab(text: 'IPI'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CstCardComponent(
                    title: 'Tabela A - Origem da Mercadoria ou Serviço',
                    data: cstIcmsA,
                  ),
                  const SizedBox(height: 10),
                  CstCardComponent(
                    title: 'Tabela B - Tributação pelo ICMS',
                    data: cstIcmsB,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: CstCardComponent(
                title: 'Tabela CST PIS / COFINS',
                data: cstPisCofins,
              ),
            ),
            SingleChildScrollView(
              child: CstCardComponent(title: 'Tabela CST IPI', data: cstIpi),
            ),
          ],
        ),
      ),
    );
  }
}

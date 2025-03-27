import 'package:flutter/material.dart';
import 'package:tax_keeper/components/cst_card_component.dart';

class CstIconDialogComponent extends StatelessWidget {
  const CstIconDialogComponent(this.title, this.data);

  final String title;
  final List<Map<String, String>> data;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:
          () => showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Fechar'),
                    ),
                  ],
                  content: SingleChildScrollView(
                    child: CstCardComponent(
                      title: 'Tabela CST $title',
                      data: data,
                    ),
                  ),
                ),
          ),
      icon: Icon(Icons.help),
    );
  }
}

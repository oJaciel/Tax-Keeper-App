import 'package:flutter/material.dart';

class CalculatorResultIconDialogComponent extends StatelessWidget {
  const CalculatorResultIconDialogComponent({super.key});

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
                  content: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'Resultado do Cálculo - Detalhado',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          _buildInfoRow('Base de Cálculo', 'Valor Total + IPI'),
                          _buildInfoRow('IPI', 'Valor Total x Alíquota IPI'),
                          _buildInfoRow(
                            'ICMS',
                            'Base de Cálculo x Alíquota ICMS',
                          ),
                          _buildInfoRow('PIS', 'Base de Cálculo x Alíquota PIS'),
                          _buildInfoRow(
                            'COFINS',
                            'Base de Cálculo x Alíquota COFINS',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ),
      icon: Icon(Icons.help),
    );
  }
}

Widget _buildInfoRow(String taxName, String calcMethod) {
  return Column(
    children: [
      Divider(),
      SizedBox(height: 5),
      Text(
        taxName,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      Text(calcMethod),
      SizedBox(height: 5),
    ],
  );
}

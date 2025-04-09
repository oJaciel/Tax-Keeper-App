import 'package:flutter/material.dart';

class CalculatorResultIconDialogComponent extends StatelessWidget {
  const CalculatorResultIconDialogComponent({
    super.key,
    required this.resultList,
  });

  final List<Map<String, double>> resultList;

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
                          _buildInfoRow(
                            'Base de Cálculo',
                            'Valor Total + IPI',
                            resultList[0]['valorTotal'],
                            '+',
                            resultList[0]['ipiValue'],
                            resultList[0]['calcBasis'],
                          ),

                          _buildInfoRow(
                            'IPI',
                            'Valor Total x Alíquota IPI',
                            resultList[0]['valorTotal'],
                            '×',
                            resultList[0]['aliquotaIpi'],
                            resultList[0]['ipiValue'],
                          ),

                          _buildInfoRow(
                            'ICMS',
                            'Base de Cálculo x Alíquota ICMS',
                            resultList[0]['calcBasis'],
                            '×',
                            resultList[0]['aliquotaIcms'],
                            resultList[0]['icmsValue'],
                          ),

                          _buildInfoRow(
                            'PIS',
                            '(Base de Cálculo - ICMS) x Alíquota PIS',
                            resultList[0]['calcBasis']! -
                                resultList[0]['icmsValue']!,
                            '×',
                            resultList[0]['aliquotaPis'],
                            resultList[0]['pisValue'],
                          ),

                          _buildInfoRow(
                            'COFINS',
                            '(Base de Cálculo - ICMS) x Alíquota COFINS',
                            resultList[0]['calcBasis']! -
                                resultList[0]['icmsValue']!,
                            '×',
                            resultList[0]['aliquotaCofins'],
                            resultList[0]['cofinsValue'],
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

Widget _buildInfoRow(
  String taxName,
  String calcMethod,
  double? value1,
  String operator,
  double? value2,
  double? calcResult,
) {
  return Column(
    children: [
      Divider(),
      SizedBox(height: 5),
      Text(
        taxName,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      Text(calcMethod),
      Text(
        '${value1?.toStringAsFixed(2) ?? '0.00'} $operator ${value2?.toStringAsFixed(2) ?? '0.00'} = ${calcResult?.toStringAsFixed(2) ?? '0.00'}',
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
      SizedBox(height: 5),
    ],
  );
}

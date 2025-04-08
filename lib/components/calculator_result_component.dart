import 'package:flutter/material.dart';
import 'package:tax_keeper/components/calculator_result_icon_dialog_component.dart';

class CalculatorResultComponent extends StatelessWidget {
  const CalculatorResultComponent(this.resultList, {super.key});

  final List<Map<String, double>> resultList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.grey.shade50,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Resultado do Cálculo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey.shade800,
                    ),
                  ),
                  CalculatorResultIconDialogComponent(),
                ],
              ),
              const SizedBox(height: 12),
              //Index vai ser sempre 0, já que lista vai ter sempre só uma entrada (lista é limpa a cada chamada da função de cálculo)
              _buildResultLine('Base de Cálculo', resultList[0]['calcBasis']),
              _buildResultLine('IPI', resultList[0]['ipiValue']),
              _buildResultLine('ICMS', resultList[0]['icmsValue']),
              _buildResultLine('PIS', resultList[0]['pisValue']),
              _buildResultLine('COFINS', resultList[0]['cofinsValue']),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultLine(String label, double? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
          ),
          Text(
            'R\$ ${value?.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

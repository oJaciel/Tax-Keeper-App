import 'package:flutter/material.dart';
import 'package:tax_keeper/components/app_drawer.dart';
import 'package:tax_keeper/components/item_calculator_card_component.dart';
import 'package:tax_keeper/models/item.dart';

class TaxCalculatorScreen extends StatefulWidget {
  const TaxCalculatorScreen({super.key});

  @override
  State<TaxCalculatorScreen> createState() => _TaxCalculatorScreenState();
}

class _TaxCalculatorScreenState extends State<TaxCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _valueController = TextEditingController();
  final _pisController = TextEditingController();
  final _cofinsController = TextEditingController();
  final _icmsController = TextEditingController();
  final _ipiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Item? item = ModalRoute.of(context)?.settings.arguments as Item?;

    if (item != null) {
      _pisController.text = item.aliquotaPis?.toString() ?? '';
      _cofinsController.text = item.aliquotaCofins?.toString() ?? '';
      _icmsController.text = item.aliquotaIcms?.toString() ?? '';
      _ipiController.text = item.aliquotaIpi?.toString() ?? '';
    }

    return Scaffold(
      appBar: AppBar(title: Text('Calculadora Fiscal')),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              children: [
                ItemCalculatorCardComponent(item: item),
                SizedBox(height: 10),
                Text(
                  'Valor',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Informe o valor total',
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                ),
                SizedBox(height: 15),
                Text(
                  'Alíquotas',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('PIS / COFINS', style: TextStyle(fontSize: 14)),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _pisController,
                        decoration: InputDecoration(labelText: 'Alíquota PIS'),
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _cofinsController,
                        decoration: InputDecoration(
                          labelText: 'Alíquota COFINS',
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text('ICMS', style: TextStyle(fontSize: 14)),
                          TextFormField(
                            controller: _icmsController,
                            decoration: InputDecoration(
                              labelText: 'Alíquota ICMS',
                            ),
                            keyboardType: TextInputType.numberWithOptions(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          Text('IPI', style: TextStyle(fontSize: 14)),
                          TextFormField(
                            controller: _ipiController,
                            decoration: InputDecoration(
                              labelText: 'Alíquota IPI',
                            ),
                            keyboardType: TextInputType.numberWithOptions(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

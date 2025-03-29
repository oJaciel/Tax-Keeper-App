import 'package:flutter/material.dart';
import 'package:tax_keeper/components/app_drawer.dart';
import 'package:tax_keeper/models/item.dart';

class TaxCalculatorScreen extends StatefulWidget {
  TaxCalculatorScreen({this.item});

  final Item? item;

  @override
  State<TaxCalculatorScreen> createState() => _TaxCalculatorScreenState();
}

class _TaxCalculatorScreenState extends State<TaxCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora Fiscal')),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              children: [ 
                TextFormField(
                  decoration: InputDecoration(labelText: 'Informe o valor total'),
                  keyboardType: TextInputType.numberWithOptions(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

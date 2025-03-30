import 'package:flutter/material.dart';
import 'package:tax_keeper/components/app_drawer.dart';
import 'package:tax_keeper/models/item.dart';

class TaxCalculatorScreen extends StatelessWidget {
  const TaxCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Item? item = ModalRoute.of(context)?.settings.arguments as Item?;

    return Scaffold(
      appBar: AppBar(title: Text('Calculadora Fiscal')),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        item != null
                            ? 'Calculando Impostos do item'
                            : 'Sem dados do item, favor informar as alíquotas manualmente',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      subtitle:
                          item != null
                              ? Text(
                                item.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                              : null,
                      leading:
                          item != null
                              ? CircleAvatar(
                                backgroundColor: Colors.black26,
                                child: Image.network(
                                  item.imageUrl,
                                  errorBuilder:
                                      (context, error, stackTrace) => Icon(
                                        Icons.image_not_supported,
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                ),
                              )
                              : null,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Informe o valor total',
                  ),
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

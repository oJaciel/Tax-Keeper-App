import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tax_keeper/providers/items_provider.dart';

class ItemFormScreen extends StatefulWidget {
  const ItemFormScreen({super.key});

  @override
  State<ItemFormScreen> createState() => _ItemFormScreenState();
}

class _ItemFormScreenState extends State<ItemFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  Future<void> _submitForm() async {
  if (!_formKey.currentState!.validate()) {
    return;
  }
  _formKey.currentState!.save(); // Aqui garantimos que _formData está preenchido

  try {
    await Provider.of<ItemsProvider>(
      context,
      listen: false,
    ).saveItem(_formData);
  } catch (error) {
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Erro!'),
        content: Text(error.toString()),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Ok'),
          ),
        ],
      ),
    );
  } finally {
    Navigator.of(context).pop();
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Produto'),
        actions: [IconButton(onPressed: _submitForm, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              //Campo de nome
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
                onSaved: (name) => _formData['name'] = name ?? '',
              ),
              //Campo de NCM
              TextFormField(
                decoration: InputDecoration(labelText: 'NCM'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(),
                onSaved: (ncm) => _formData['ncm'] = ncm ?? '',
              ),
              //Campo de URL da imagem
              TextFormField(
                decoration: InputDecoration(labelText: 'URL da Imagem'),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.url,
                onSaved: (imageUrl) => _formData['imageUrl'] = imageUrl ?? '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

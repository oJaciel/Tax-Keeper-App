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
    _formKey.currentState!.save();

    try {
      await Provider.of<ItemsProvider>(
        context,
        listen: false,
      ).saveItem(_formData);
    } catch (error) {
      await showDialog<void>(
        context: context,
        builder:
            (ctx) => AlertDialog(
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
              // Campo de Nome
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
                onSaved: (name) => _formData['name'] = name ?? 'N/A',
              ),

              // Campo de NCM
              TextFormField(
                decoration: InputDecoration(labelText: 'NCM'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(),
                onSaved: (ncm) => _formData['ncm'] = ncm ?? 'N/A',
              ),

              // Campo de Código de Barras
              TextFormField(
                decoration: InputDecoration(labelText: 'Código de Barras'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onSaved:
                    (codigoBarras) =>
                        _formData['codigoBarras'] = codigoBarras ?? 'N/A',
              ),

              // Campo de CEST
              TextFormField(
                decoration: InputDecoration(labelText: 'CEST'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onSaved: (cest) => _formData['cest'] = cest ?? 'N/A',
              ),

              // CST ICMS e Alíquota ICMS lado a lado
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'CST ICMS'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onSaved:
                          (cstIcms) => _formData['cstIcms'] = cstIcms ?? 'N/A',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Alíquota ICMS'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      onSaved:
                          (aliquotaIcms) =>
                              _formData['aliquotaIcms'] =
                                  double.tryParse(aliquotaIcms ?? '') ?? 0.0,
                    ),
                  ),
                ],
              ),

              // CST IPI e Alíquota IPI lado a lado
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'CST IPI'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onSaved:
                          (cstIpi) => _formData['cstIpi'] = cstIpi ?? 'N/A',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Alíquota IPI'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      onSaved:
                          (aliquotaIpi) =>
                              _formData['aliquotaIpi'] =
                                  double.tryParse(aliquotaIpi ?? '') ?? 0.0,
                    ),
                  ),
                ],
              ),

              // CST PIS e Alíquota PIS lado a lado
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'CST PIS'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onSaved:
                          (cstPis) => _formData['cstPis'] = cstPis ?? 'N/A',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Alíquota PIS'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      onSaved:
                          (aliquotaPis) =>
                              _formData['aliquotaPis'] =
                                  double.tryParse(aliquotaPis ?? '') ?? 0.0,
                    ),
                  ),
                ],
              ),

              // CST COFINS e Alíquota COFINS lado a lado
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'CST COFINS'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onSaved:
                          (cstCofins) =>
                              _formData['cstCofins'] = cstCofins ?? 'N/A',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Alíquota COFINS'),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      onSaved:
                          (aliquotaCofins) =>
                              _formData['aliquotaCofins'] =
                                  double.tryParse(aliquotaCofins ?? '') ?? 0.0,
                    ),
                  ),
                ],
              ),

              // Campo de URL da imagem
              TextFormField(
                decoration: InputDecoration(labelText: 'URL da Imagem'),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.url,
                onSaved:
                    (imageUrl) => _formData['imageUrl'] = imageUrl ?? 'N/A',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

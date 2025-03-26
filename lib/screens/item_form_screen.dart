import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tax_keeper/models/item.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final argument = ModalRoute.of(context)?.settings.arguments;

      if (argument != null) {
        final item = argument as Item;
        _formData['id'] = item.id;
        _formData['name'] = item.name;
        _formData['ncm'] = item.ncm;
        _formData['codigoBarras'] = item.codigoBarras!;
        _formData['cest'] = item.cest!;
        _formData['cstIcms'] = item.cstIcms!;
        _formData['aliquotaIcms'] = item.aliquotaIcms!;
        _formData['cstIpi'] = item.cstIpi!;
        _formData['aliquotaIpi'] = item.aliquotaIpi!;
        _formData['cstPis'] = item.cstPis!;
        _formData['aliquotaPis'] = item.aliquotaPis!;
        _formData['cstCofins'] = item.cstCofins!;
        _formData['aliquotaCofins'] = item.aliquotaCofins!;
        _formData['imageUrl'] = item.imageUrl;
      }

      if (argument != null && argument is Map<String, dynamic>) {}
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
              Text(
                'Geral',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              // Campo de Nome
              TextFormField(
                initialValue: _formData['name']?.toString(),
                decoration: InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
                onSaved: (name) => _formData['name'] = name ?? 'N/A',
              ),

              // Campo de NCM
              TextFormField(
                initialValue: _formData['ncm']?.toString(),
                decoration: InputDecoration(labelText: 'NCM'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(),
                onSaved: (ncm) => _formData['ncm'] = ncm ?? 'N/A',
              ),

              // Campo de Código de Barras
              TextFormField(
                initialValue: _formData['codigoBarras']?.toString(),
                decoration: InputDecoration(labelText: 'Código de Barras'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onSaved:
                    (codigoBarras) =>
                        _formData['codigoBarras'] = codigoBarras ?? 'N/A',
              ),

              // Campo de URL da imagem
              TextFormField(
                initialValue: _formData['imageUrl']?.toString(),
                decoration: InputDecoration(labelText: 'URL da Imagem'),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.url,
                onSaved:
                    (imageUrl) => _formData['imageUrl'] = imageUrl ?? 'N/A',
              ),

              SizedBox(height: 10),
              Text(
                'Fiscal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              // Campo de CEST
              TextFormField(
                initialValue: _formData['cest']?.toString(),
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
                      initialValue: _formData['cstIcms']?.toString(),
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
                      initialValue: _formData['aliquotaIcms']?.toString(),
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
                      initialValue: _formData['cstIpi']?.toString(),
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
                      initialValue: _formData['aliquotaIpi']?.toString(),
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
                      initialValue: _formData['cstPis']?.toString(),
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
                      initialValue: _formData['aliquotaPis']?.toString(),
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
                      initialValue: _formData['cstCofins']?.toString(),
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
                      initialValue: _formData['aliquotaCofins']?.toString(),
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
            ],
          ),
        ),
      ),
    );
  }
}

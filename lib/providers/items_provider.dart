import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tax_keeper/models/item.dart';
import 'package:http/http.dart' as http;
import 'package:tax_keeper/utils/constants.dart';

class ItemsProvider with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items {
    return [..._items];
  }

  //Método para carregar os itens do banco de dados
  Future<void> loadProducts() async {
    _items.clear();
    final response = await http.get(
      Uri.parse('${Constants.ITEM_BASE_URL}.json'),
    );

    if (response.body == 'null' || response.body.isEmpty) return;

    Map<String, dynamic> data = jsonDecode(response.body);

    data.forEach((itemId, itemData) {
      _items.add(
        Item(
          id: itemId,
          name: itemData['name'] ?? '',
          ncm: itemData['ncm'] ?? '',
          imageUrl: itemData['imageUrl'] ?? '',
          codigoBarras: itemData['codigoBarras'] ?? '',
          cest: itemData['cest'] ?? '',
          cstIcms: itemData['cstIcms'] ?? '',
          aliquotaIcms: (itemData['aliquotaIcms'] as num?)?.toDouble() ?? 0.0,
          cstIpi: itemData['cstIpi'] ?? '',
          aliquotaIpi: (itemData['aliquotaIpi'] as num?)?.toDouble() ?? 0.0,
          cstPis: itemData['cstPis'] ?? '',
          aliquotaPis: (itemData['aliquotaPis'] as num?)?.toDouble() ?? 0.0,
          cstCofins: itemData['cstCofins'] ?? '',
          aliquotaCofins:
              (itemData['aliquotaCofins'] as num?)?.toDouble() ?? 0.0,
        ),
      );
    });

    notifyListeners();
  }

  Future<void> saveItem(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final item = Item(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      ncm: data['ncm'] as String,
      imageUrl: data['imageUrl'] as String,
      codigoBarras: data['codigoBarras'] as String,
      cest: data['cest'] as String,
      cstIcms: data['cstIcms'] as String,
      aliquotaIcms: data['aliquotaIcms'] as double,
      cstIpi: data['cstIpi'] as String,
      aliquotaIpi: data['aliquotaIpi'] as double,
      cstPis: data['cstPis'] as String,
      aliquotaPis: data['aliquotaPis'] as double,
      cstCofins: data['cstCofins'] as String,
      aliquotaCofins: data['aliquotaCofins'] as double,
    );

    return addItem(item);
  }

  //Método para salvar item no banco de dados e localmente
  Future<void> addItem(Item item) async {
    final response = await http.post(
      Uri.parse('${Constants.ITEM_BASE_URL}.json'),
      body: jsonEncode({
        "name": item.name,
        "ncm": item.ncm,
        "imageUrl": item.imageUrl,
        "codigoBarras": item.codigoBarras,
        "cest": item.cest,
        "cstIcms": item.cstIcms,
        "aliquotaIcms": item.aliquotaIcms,
        "cstIpi": item.cstIpi,
        "aliquotaIpi": item.aliquotaIpi,
        "cstPis": item.cstPis,
        "aliquotaPis": item.aliquotaPis,
        "cstCofins": item.cstCofins,
        "aliquotaCofins": item.aliquotaCofins,
      }),
    );

    final id = jsonDecode(response.body)['name'];

    _items.add(
      Item(
        id: id,
        name: item.name,
        ncm: item.ncm,
        imageUrl: item.imageUrl,
        codigoBarras: item.codigoBarras,
        cest: item.cest,
        cstIcms: item.cstIcms,
        aliquotaIcms: item.aliquotaIcms,
        cstIpi: item.cstIpi,
        aliquotaIpi: item.aliquotaIpi,
        cstPis: item.cstPis,
        aliquotaPis: item.aliquotaPis,
        cstCofins: item.cstCofins,
        aliquotaCofins: item.aliquotaCofins,
      ),
    );

    notifyListeners();
  }

  //Método para remover item do banco de dados
  void removeItem(Item item) async {
    int index = _items.indexWhere((i) => i.id == item.id);

    if (index >= 0) {
      final item = _items[index];

      //Primeiro excluindo o item localmente
      _items.remove(item);
      notifyListeners();

      //Agora removendo no servidor
      final response = await http.delete(
        Uri.parse('${Constants.ITEM_BASE_URL}/${item.id}.json'),
      );

      //Se der erro no servidor, o produto é reinserido
      if (response.statusCode >= 400) {
        _items.insert(index, item);
        notifyListeners();
      }
    }
  }
}

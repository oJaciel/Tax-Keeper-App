import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tax_keeper/models/item.dart';
import 'package:tax_keeper/utils/constants.dart';

class NcmProvider with ChangeNotifier {
  List<Map<String, dynamic>> _ncm_list = [];

  List<Map<String, dynamic>> get ncm_list {
    return [..._ncm_list];
  }

  Future<void> loadItemsNcm(List<Item> items) async {
    _ncm_list.clear();

    for (var item in items) {
      final itemNcm = item.ncm.replaceAll('.', '');

      if (itemNcm.isEmpty) {
        continue; //Se NCM for vazio, ignora o item
      }

      final response = await http.get(
        Uri.parse('${Constants.NCM_API_BASE_URL}/$itemNcm'),
      );

      if (response.body == 'null' || response.body.isEmpty) {
        continue; // Se a resposta for vazia ou nula, ignora o item
      }

      final Map<String, dynamic> ncmData = jsonDecode(response.body);

      // Verificar se 'codigo' ou 'descricao' são null, caso sejam, atribuir valores padrão
      _ncm_list.add({
        //Adicionando na lista o item passado, o código NCM e a descrição do NCM
        'item': item,
        'codigo': ncmData['codigo'] ?? 'Código não disponível',
        'descricao': ncmData['descricao'] ?? 'Descrição não disponível',
      });
    }

    notifyListeners();
  }

  Future searchNcm(String ncm) async {
    final formattedNcm = ncm.replaceAll('.', '');

    final response = await http.get(
      Uri.parse('${Constants.NCM_API_BASE_URL}/$formattedNcm'),
    );

    final Map<String, dynamic> ncmData = jsonDecode(response.body);

    if (ncmData['descricao'] == null) {
      return 'NCM inexistente. Verifique os dígitos e tente novamente.';
    } else {
      return '${ncmData['codigo']} - ${ncmData['descricao']}';
    }
  }
}



  // Future<void> loadAllNcm() async {
  //   _ncm_list.clear();
  //   final response = await http.get(Uri.parse(Constants.NCM_API_BASE_URL));
  //   if (response.body == 'null' || response.body.isEmpty) {
  //     return;
  //   }
  //   final List<dynamic> data = jsonDecode(response.body);
  //   for (var item in data) {
  //     _ncm_list.add({'codigo': item['codigo'], 'descricao': item['descricao']});
  //   }
  //   notifyListeners();
  // }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tax_keeper/utils/constants.dart';

class NcmProvider with ChangeNotifier {
  List<Map<String, String>> _ncm_list = [];

  List<Map<String, String>> get ncm_list {
    return [..._ncm_list];
  }

  Future<void> loadNcm() async {
    _ncm_list.clear();

    final response = await http.get(Uri.parse(Constants.NCM_API_BASE_URL));

    if (response.body == 'null' || response.body.isEmpty) {
      return;
    }

    final List<dynamic> data = jsonDecode(response.body);

    for (var item in data) {
      _ncm_list.add({'codigo': item['codigo'], 'descricao': item['descricao']});
    }

    notifyListeners();
  }
}

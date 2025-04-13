class CstFilterProvider {
  static List<Map<String, String>> filterCst(
    List<Map<String, String>> cstTable,
    String? itemCst,
  ) {
    //Se o item não tiver CST, mostra todas
    if (itemCst == null || itemCst.isEmpty) {
      return cstTable;
    }

    // Se for código CST de ICMS (3 dígitos)
    if (itemCst.length == 3) {
      final filter =
          cstTable
              .where((data) => data['cod'] == itemCst.substring(1))
              .toList();
      return filter.isEmpty ? cstTable : filter;
    }

    // Para os demais CSTs (2 dígitos)
    final filter =
        cstTable
            .where((data) => data['cod']?.endsWith(itemCst) ?? false)
            .toList();

    //Se não tiver como filtrar (CST inválida = filtro vazio) retorna a tabela toda
    return filter.isEmpty ? cstTable : filter;
  }

  static List<Map<String, String>> filterCstIcms(
    List<Map<String, String>> cstTableA,
    List<Map<String, String>> cstTableB,
    String? itemCst,
  ) {
    //Se o item não tiver CST, mostra todas
    if (itemCst == null || itemCst.isEmpty) {
      return cstTableA + cstTableB;
    }

    var filter = cstTableA.where((data) => data['cod'] == itemCst[0]).toList();

    // Para os demais CSTs (2 dígitos)
    filter +=
        cstTableB.where((data) => data['cod'] == itemCst.substring(1)).toList();

    //Se não tiver como filtrar (CST inválida = filtro vazio) retorna a tabela toda
    return filter.isEmpty ? cstTableA + cstTableB : filter;
  }
}

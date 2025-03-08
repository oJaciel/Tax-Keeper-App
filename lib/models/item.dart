class Item {
  final String id;
  final String name;
  final String ncm;
  final String? codigoBarras;
  final String? cest;
  final String? cstIcms;
  final double? aliquotaIcms;
  final String? cstIpi;
  final double? aliquotaIpi;
  final String? cstPis;
  final double? aliquotaPis;
  final String? cstCofins;
  final double? aliquotaCofins;

  Item({
    required this.id,
    required this.name,
    required this.ncm,
    this.codigoBarras,
    this.cest,
    this.cstIcms,
    this.aliquotaIcms,
    this.cstIpi,
    this.aliquotaIpi,
    this.cstPis,
    this.aliquotaPis,
    this.cstCofins,
    this.aliquotaCofins,
  });
}

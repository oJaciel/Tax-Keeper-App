import 'package:tax_keeper/models/item.dart';

final List<Item> dummyItems = [
  Item(
    id: "001",
    name: "Produto A",
    ncm: "12345678",
    imageUrl:'https://www.w3.org/Icons/w3c_home.png'
,
    codigoBarras: "7891234567890",
    cest: "100000",
    cstIcms: "00",
    aliquotaIcms: 18.0,
    cstIpi: '00.0',
    aliquotaIpi: 5.0,
    cstPis: "01",
    aliquotaPis: 1.65,
    cstCofins: "01",
    aliquotaCofins: 7.6,
  ),
  Item(
    id: "002",
    name: "Produto B",
    ncm: "23456789",
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwQWjMj6OqKFlKoN3oXIDL7bJaHRAlVdDn0w&s',
    codigoBarras: "7892345678901",
    cest: "200000",
    cstIcms: "10",
    aliquotaIcms: 12.0,
    cstIpi: '01.0',
    aliquotaIpi: 18.0,
    cstPis: "02",
    aliquotaPis: 0.65,
    cstCofins: "02",
    aliquotaCofins: 3.0,
  ),
  Item(
    id: "003",
    name: "Produto C",
    ncm: "34567890",
    imageUrl: 'https://cwsmalotes.com.br/wp-content/uploads/2022/07/15137691766_produto-de-teste-do-desenvolvedor.jpg',
    codigoBarras: "7893456789012",
    cest: "300000",
    cstIcms: "60",
    aliquotaIcms: 25.0,
    cstIpi: '50.0',
    aliquotaIpi: 12.0,
    cstPis: "03",
    aliquotaPis: 2.0,
    cstCofins: "03",
    aliquotaCofins: 8.0,
  ),
  Item(
    id: "004",
    name: "Produto D",
    ncm: "45678901",
    imageUrl: 'https://cwsmalotes.com.br/wp-content/uploads/2022/07/15137691766_produto-de-teste-do-desenvolvedor.jpg',
    codigoBarras: "7894567890123",
    cest: "400000",
    cstIcms: "20",
    aliquotaIcms: 18.0,
    cstIpi: '00.0',
    aliquotaIpi: 5.0,
    cstPis: "04",
    aliquotaPis: 1.50,
    cstCofins: "04",
    aliquotaCofins: 7.5,
  ),
  Item(
    id: "005",
    name: "Produto E",
    ncm: "56789012",
    imageUrl: 'https://cwsmalotes.com.br/wp-content/uploads/2022/07/15137691766_produto-de-teste-do-desenvolvedor.jpg',
    codigoBarras: "7895678901234",
    cest: "500000",
    cstIcms: "30",
    aliquotaIcms: 17.0,
    cstIpi: '10.0',
    aliquotaIpi: 10.0,
    cstPis: "05",
    aliquotaPis: 2.00,
    cstCofins: "05",
    aliquotaCofins: 9.0,
  ),
];

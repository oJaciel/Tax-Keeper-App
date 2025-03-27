import 'package:flutter/material.dart';
import 'package:tax_keeper/components/cst_icon_dialog_component.dart';
import 'package:tax_keeper/data/cst_data.dart';
import 'package:tax_keeper/models/item.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do produto
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) => Icon(
                        Icons.image_not_supported,
                        size: 100,
                        color: Colors.grey,
                      ),
                ),
              ),
            ),

            SizedBox(height: 16),

            // Informações principais
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  _buildInfoRow("NCM", item.ncm),
                  _buildInfoRow("Código de Barras", item.codigoBarras),
                  _buildInfoRow("CEST", item.cest),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Informações fiscais
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        'Informações Fiscais',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _buildInfoRow("CST ICMS", item.cstIcms),
                          ),
                          CstIconDialogComponent('ICMS', cstIcmsA + cstIcmsB),
                        ],
                      ),

                      _buildInfoRow(
                        "Alíquota ICMS",
                        item.aliquotaIcms?.toString(),
                        suffix: "%",
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: _buildInfoRow("CST IPI", item.cstIpi),
                          ),
                          CstIconDialogComponent('IPI', cstIpi),
                        ],
                      ),

                      _buildInfoRow(
                        "Alíquota IPI",
                        item.aliquotaIpi?.toString(),
                        suffix: "%",
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: _buildInfoRow("CST PIS", item.cstPis),
                          ),
                          CstIconDialogComponent('PIS / COFINS', cstPisCofins),
                        ],
                      ),

                      _buildInfoRow(
                        "Alíquota PIS",
                        item.aliquotaPis?.toString(),
                        suffix: "%",
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: _buildInfoRow("CST COFINS", item.cstCofins),
                          ),
                          CstIconDialogComponent('PIS / COFINS', cstPisCofins),
                        ],
                      ),

                      _buildInfoRow(
                        "Alíquota COFINS",
                        item.aliquotaCofins?.toString(),
                        suffix: "%",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método auxiliar para exibir informações fiscais (se vazias, ficam com espaço reservado)
  Widget _buildInfoRow(String label, String? value, {String suffix = ""}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('$value $suffix', style: TextStyle(fontSize: 16)),
            ),
          ), // Exibe string vazia se não houver valor
        ],
      ),
    );
  }
}

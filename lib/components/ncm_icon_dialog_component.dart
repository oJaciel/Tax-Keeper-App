import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tax_keeper/models/item.dart';
import 'package:tax_keeper/providers/ncm_provider.dart';

class NcmIconDialogComponent extends StatefulWidget {
  const NcmIconDialogComponent(this.item, {super.key});

  final Item item;

  @override
  State<NcmIconDialogComponent> createState() => _NcmIconDialogComponentState();
}

class _NcmIconDialogComponentState extends State<NcmIconDialogComponent> {
  String result = '';

  _getNcm(Item item) async {
    final response = await Provider.of<NcmProvider>(
      context,
      listen: false,
    ).searchNcm(item.ncm);

    setState(() {
      result = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await _getNcm(widget.item);

        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Fechar'),
                  ),
                ],
                content: Text(
                  result,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
        );
      },
      icon: Icon(Icons.info),
    );
  }
}

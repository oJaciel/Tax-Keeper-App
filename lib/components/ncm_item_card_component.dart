import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tax_keeper/components/image_circle_avatar_component.dart';
import 'package:tax_keeper/models/item.dart';
import 'package:tax_keeper/providers/items_provider.dart';
import 'package:tax_keeper/providers/ncm_provider.dart';

class NcmItemCardComponent extends StatefulWidget {
  const NcmItemCardComponent({super.key});

  @override
  State<NcmItemCardComponent> createState() => _NcmItemCardComponentState();
}

class _NcmItemCardComponentState extends State<NcmItemCardComponent> {
  bool _isInit = true;

  bool _showNcm = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final items = Provider.of<ItemsProvider>(context, listen: false).items;

      Future.microtask(() {
        Provider.of<NcmProvider>(context, listen: false).loadItemsNcm(items);
      });

      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NcmProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Seus NCM cadastrados',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _showNcm = !_showNcm;
                      });
                      print(_showNcm);
                    },
                    icon:
                        _showNcm == false
                            ? Icon(Icons.keyboard_arrow_down)
                            : Icon(Icons.keyboard_arrow_up),
                  ),
                ],
              ),
              _showNcm == false
                  ? SizedBox()
                  : SizedBox(
                    height: 200,
                    child:
                        provider.ncm_list.isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                              itemCount: provider.ncm_list.length,
                              itemBuilder: (context, index) {
                                final Item item =
                                    provider.ncm_list[index]['item'] ?? '';
                                final codigo =
                                    provider.ncm_list[index]['codigo'] ?? '';
                                final descricao =
                                    provider.ncm_list[index]['descricao'] ?? '';

                                return ListTile(
                                  leading: ImageCircleAvatarComponent(
                                    item: item, size: 20,
                                  ),
                                  title: Text(
                                    item.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: Text('$codigo - $descricao'),
                                );
                              },
                            ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

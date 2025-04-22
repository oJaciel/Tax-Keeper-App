import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:tax_keeper/providers/ncm_provider.dart';

class NcmSearchComponent extends StatefulWidget {
  const NcmSearchComponent({super.key});

  @override
  State<NcmSearchComponent> createState() => _NcmSearchComponentState();
}

class _NcmSearchComponentState extends State<NcmSearchComponent> {
  final _formKey = GlobalKey<FormState>();
  final _ncmController = TextEditingController();
  String result = '';
  bool submittedForm = false;

  @override
  void dispose() {
    _ncmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NcmProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Consulta de NCM',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 4),
        const Text(
          'Informe o NCM abaixo para consulta',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        const SizedBox(height: 12),
        Form(
          key: _formKey,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'NCM'),
                  controller: _ncmController,
                  textInputAction: TextInputAction.done,
                  keyboardType: const TextInputType.numberWithOptions(),
                  inputFormatters: [
                    MaskTextInputFormatter(
                      mask: '####.##.##',
                      filter: {"#": RegExp(r'[0-9]')},
                    ),
                  ],
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'NCM é obrigatório.';
                    }
                    if (value.trim().length < 10) {
                      return 'NCM deve ter 8 dígitos';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {

                    setState(() {
                      submittedForm = true;
                    });
                    
                    final response = await provider.searchNcm(_ncmController.text);

                    setState(() {
                      result = response;
                    });
                  }
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        if (result.isEmpty && submittedForm == true)
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Center(child: CircularProgressIndicator()),
                SizedBox(height: 25,),
                Text('Buscando NCM, aguarde')
              ],
            ),
          )
        else
          Text(result, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}

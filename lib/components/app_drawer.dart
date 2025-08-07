import 'package:flutter/material.dart';
import 'package:tax_keeper/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(title: Text('Bem vindo!'), automaticallyImplyLeading: false),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Início'),
            onTap: () {
              Navigator.pop(context); //Fecha o Drawer
              Navigator.of(context).pushNamed(AppRoutes.HOME);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Gerenciar Itens'),
            onTap: () {
              Navigator.pop(context); //Fecha o Drawer
              Navigator.of(context).pushNamed(AppRoutes.ITEMS);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Calculadora Fiscal'),
            onTap: () {
              Navigator.pop(context); //Fecha o Drawer
              Navigator.of(context).pushNamed(AppRoutes.TAX_CALCULATOR);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.pin),
            title: Text('Consultar CST'),
            onTap: () {
              Navigator.pop(context); //Fecha o Drawer
              Navigator.of(context).pushNamed(AppRoutes.CST);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.new_label),
            title: Text('Consultar NCM'),
            onTap: () {
              Navigator.pop(context); //Fecha o Drawer
              Navigator.of(context).pushNamed(AppRoutes.NCM);
            },
          ),
        ],
      ),
    );
  }
}

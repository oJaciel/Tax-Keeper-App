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
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Gerenciar Itens'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.ITEMS);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.format_list_numbered),
            title: Text('Consultar CST'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.CST);
            },
          ),
        ],
      ),
    );
  }
}

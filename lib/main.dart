import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tax_keeper/providers/items_provider.dart';
import 'package:tax_keeper/screens/item_detail_screen.dart';
import 'package:tax_keeper/screens/item_form_screen.dart';
import 'package:tax_keeper/screens/items_overview_screen.dart';
import 'package:tax_keeper/screens/items_screen.dart';
import 'package:tax_keeper/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemsProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tax Keeper',
        routes: {
          AppRoutes.HOME: (ctx) => ItemsOverviewScreen(),
          AppRoutes.ITEM_DETAIL: (ctx) => ItemDetailScreen(),
          AppRoutes.ITEMS: (ctx) => ItemsScreen(),
          AppRoutes.ITEM_FORM: (ctx) => ItemFormScreen(),
        }

        ,
      ),
    );
  }
}

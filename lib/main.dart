import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/warehouse_selection_screen.dart';
import 'screens/stocktake_screen.dart';
import 'screens/stocktake_form_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stellium Warehouse App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/warehouse_selection': (context) => WarehouseSelectionScreen(),
        '/stocktake': (context) => StocktakeScreen(),
        '/stocktake_form': (context) => StocktakeFormScreen(),
      },
    );
  }
}

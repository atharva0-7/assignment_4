import 'package:assignment_4_stock_app/providers/stock_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>StockProvider(),
      child: MaterialApp(
        title: 'Stock App',
        
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const MainScreen(),
      ),
    );
  }
}


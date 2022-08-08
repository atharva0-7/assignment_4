import 'dart:async';
import 'dart:math';

import 'package:assignment_4_stock_app/providers/stock_provider.dart';
import 'package:assignment_4_stock_app/widgets/stock_container.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Timer timer;
  // Random random =  Random();
@override 
void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      Provider.of<StockProvider>(context,listen: false).generateStockPrice();
      Provider.of<StockProvider>(context,listen: false).incrementQuantityAndTotalPrice();

    } );
  }

  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A3FF).withOpacity(0.71),
        title:  Text("Portfolio",style:GoogleFonts.rocknRollOne(
          fontSize: 32
        ),),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
           StockContainer(
            title: "APPLE",
            color: const Color(0xFFAADE98),
            imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/1667px-Apple_logo_black.svg.png",
            stockPrice: Provider.of<StockProvider>(context).getStockPrice().toString(),
          ),
          Padding(
            padding: const EdgeInsets.only(top:106),
            child: Text("Quantity: ${Provider.of<StockProvider>(context).getQuantity()}",style: GoogleFonts.rocknRollOne(fontSize: 32),),
          ),
          Padding(
            padding: const EdgeInsets.only(top:36),
            child: Text("Total: \$${Provider.of<StockProvider>(context).getTotalPrice()}",style: GoogleFonts.rocknRollOne(fontSize: 32),),
          )
        ]),
      ),
    );
  }
}
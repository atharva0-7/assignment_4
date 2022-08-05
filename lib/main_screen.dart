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
  Random random =  Random();
@override 
void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      Provider.of<StockProvider>(context,listen: false).generateStockPrice(random);
      Provider.of<StockProvider>(context,listen: false).incrementQuantityAndTotalPrice();

    } );
  }

  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      appBar: AppBar(
        title:  Text("Portfolio",style:GoogleFonts.rocknRollOne(
          fontSize: 32
        ),),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
           StockContainer(
            imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/1667px-Apple_logo_black.svg.png",
            title: "APPLE",
            stockPrice: Provider.of<StockProvider>(context).getAppleStockPrice().toString(),
            color: const Color(0xFFAADE98)
           ),
           StockContainer(
            imageUrl: "https://i.pinimg.com/originals/01/ca/da/01cada77a0a7d326d85b7969fe26a728.jpg",
            title: "AMAZON",
            stockPrice: Provider.of<StockProvider>(context).getAmazonStockPrice().toString(),
            color: const Color.fromARGB(255, 222, 203, 152)
           ),
           StockContainer(
            imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Samsung_Logo.svg/2560px-Samsung_Logo.svg.png",
            title: "SAMSUNG",
            stockPrice: Provider.of<StockProvider>(context).getSamsungStockPrice().toString(),
            color: const Color(0xFFAADE98)
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
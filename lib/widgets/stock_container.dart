import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/stock_provider.dart';

class StockContainer extends StatelessWidget {
  const StockContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158,
      width: MediaQuery.of(context).size.width,
      margin:const EdgeInsets.only(left: 16,right: 16,top: 16),
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFAADE98)
      ),
      child: Row(
        
        children:[
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipOval(
                child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/1667px-Apple_logo_black.svg.png")),
            ),
            ),
        ),
          Padding(
            padding: const EdgeInsets.only(left:16.0),
            child: Text("APPLE",style: GoogleFonts.rocknRollOne(fontSize: 24,fontWeight: FontWeight.w400),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:97),
            child: Text("\$${Provider.of<StockProvider>(context).getStockPrice()}",style: GoogleFonts.rocknRollOne(fontSize: 24,fontWeight: FontWeight.w400),),
          )
      ]
      ),
    );
  }
}
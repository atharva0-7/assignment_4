import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StockContainer extends StatelessWidget {
  Color color;
  String imageUrl;
  String stockPrice;
  String title;
  StockContainer({required this.imageUrl,required this.stockPrice,required this.title,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158,
      width: MediaQuery.of(context).size.width,
      margin:const EdgeInsets.only(left: 16,right: 16,top: 16),
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:[
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipOval(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) => 
                CircularProgressIndicator(value: downloadProgress.progress),
                  // placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: imageUrl,
                 ),
              ),
            ),
            ),
        ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left:16.0),
              child: Text(title,style: GoogleFonts.rocknRollOne(fontSize: 24,fontWeight: FontWeight.w400),),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text("\$$stockPrice",style: GoogleFonts.rocknRollOne(fontSize: 24,fontWeight: FontWeight.w400),))
      ]
      ),
    );
  }
}
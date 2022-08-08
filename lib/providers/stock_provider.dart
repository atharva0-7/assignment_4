import 'dart:math';

import 'package:flutter/material.dart';

class StockProvider with ChangeNotifier{
  
  int _stockPrice = 0;
  int _amazonStock = 0;
  int _samsungStock = 0;
  int _appleStock = 0;

  int _quantity = 0;
  int _totalPrice = 0;

  
   generateStockPrice()
  {
     Random random = Random();
     _amazonStock = random.nextInt(100);
     _samsungStock = random.nextInt(100);
     _appleStock = random.nextInt(100);
     notifyListeners();
  }

  
  incrementQuantityAndTotalPrice()
  {
    if(_amazonStock < 20 )
    {
      _totalPrice += _amazonStock;
      _quantity++;
    }
    if(_samsungStock<20)
    {
       _totalPrice += _samsungStock;
      _quantity++;
    }
    if(_appleStock<20)
    {
       _totalPrice += _appleStock;
      _quantity++;
    }
    notifyListeners();
  }

  
  getTotalPrice()
  {
    return _totalPrice;
  }
  getApplePrice()
  {
    return _appleStock;
  }
    getSamsungPrice()
  {
    return _samsungStock;
  }
    getAmazonPrice()
  {
    return _amazonStock;
  }
  getQuantity()
  {
    return _quantity;
  }

  }
 

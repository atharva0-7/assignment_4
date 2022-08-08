import 'dart:math';

import 'package:flutter/material.dart';

class StockProvider with ChangeNotifier{
  
  int _stockPrice = 0;
  int _quantity = 0;
  int _totalPrice = 0;

  
   generateStockPrice()
  {
    Random random = Random();
     _stockPrice = random.nextInt(100);
     notifyListeners();
  }

  
  incrementQuantityAndTotalPrice()
  {
    if(_stockPrice < 20)
    {
      _totalPrice += _stockPrice;
      _quantity++;
    }
    notifyListeners();
  }

  
  getTotalPrice()
  {
    return _totalPrice;
  }
  getStockPrice()
  {
    return _stockPrice;
  }
  getQuantity()
  {
    return _quantity;
  }

  }
 

import 'dart:math';

import 'package:flutter/material.dart';

class StockProvider with ChangeNotifier{
  
  int _appleStockPrice = 0;
  int _amazonStockPrice = 0;
  int _samsungStockPrice = 0;
  int _quantity = 0;
  int _totalPrice = 0;

  
   generateStockPrice(Random random)
 {
     _amazonStockPrice = random.nextInt(100);
     _appleStockPrice = random.nextInt(100);
     _samsungStockPrice = random.nextInt(100);
     notifyListeners();
  }

  
  incrementQuantityAndTotalPrice()
  {
    if(_amazonStockPrice < 20 )
    {
      _totalPrice += _amazonStockPrice;
      _quantity++;
    }
    if(_appleStockPrice<20)
    {
      _totalPrice += _appleStockPrice;
      _quantity++;
    }
     if(_samsungStockPrice<20)
    {
      _totalPrice += _samsungStockPrice;
      _quantity++;
    }
    notifyListeners();
  }

  
  getTotalPrice()
  {
    return _totalPrice;
  }
  getAppleStockPrice()
  {
    return _appleStockPrice;
  }
  getSamsungStockPrice()
  {
    return _samsungStockPrice;
  }
  getAmazonStockPrice()
  {
    return _amazonStockPrice;
  }
  getQuantity()
  {
    return _quantity;
  }

  }
 

import 'package:flutter/material.dart';
import 'package:qitea/models/product.dart';

class ProductState extends ChangeNotifier {


    Product? _currentProduct;

  void setCurrentProduct(Product product) {
    _currentProduct = product;
    notifyListeners();
  }

  Product get currentProduct => _currentProduct!;


}
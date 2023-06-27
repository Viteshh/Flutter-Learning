import 'package:first_app/product_listing/product_model.dart';
import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  final List<Products> _favProducts = [];

  List<Products> get favProducts => _favProducts;

  void addItems(Products product) {
    _favProducts.add(product);
    notifyListeners();
  }

  void removeItems(Products product) {
    _favProducts.remove(product);
    notifyListeners();
  }
}

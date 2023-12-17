import 'package:e_commerce/config/cart/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductProviderInterior extends ChangeNotifier {
  final List<ProductModel> _interior = [
    // Productos existentes
    ProductModel(
      name: "Ropa interior (2 partes)",
      price: 30.00,
      image:
          "lenceria Interior",
      isAvailable: true, sizes: [], description: '',
    ),
    ProductModel(
      name: "Lenceria Interior",
      price: 26.77,
      image:
          "",
      isAvailable: true, sizes: [], description: '',
    ),
    ProductModel(
      name: "Lencería color negro",
      price: 99.99,
      image:
          "",
      isAvailable: true, sizes: [], description: '',
    ),
    ProductModel(
      name: "Lenceria Interior",
      price: 25.99,
      image:
          "",
      isAvailable: true, sizes: [], description: '',
    ),
    ProductModel(
      name: "Lenceria Interior",
      price: 129,
      image:
          "",
      isAvailable: true, sizes: [], description: '',
    ),
    
  ];
  void selectSize(int index, String size) {
    if (index >= 0 && index < _interior.length) {
      _interior[index].selectedSize = size;
    }
  }
  List<ProductModel> get interior => _interior;
}

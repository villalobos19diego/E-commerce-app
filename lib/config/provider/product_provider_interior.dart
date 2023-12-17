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
      isAvailable: true,
    ),
    ProductModel(
      name: "Lenceria Interior",
      price: 26.77,
      image:
          "",
      isAvailable: true,
    ),
    ProductModel(
      name: "Lencería color negro",
      price: 99.99,
      image:
          "",
      isAvailable: true,
    ),
    ProductModel(
      name: "Lenceria Interior",
      price: 25.99,
      image:
          "",
      isAvailable: true,
    ),
    ProductModel(
      name: "Lenceria Ineterior",
      price: 129,
      image:
          "",
      isAvailable: true,
    ),
    
  ];

  List<ProductModel> get interior => _interior;
}

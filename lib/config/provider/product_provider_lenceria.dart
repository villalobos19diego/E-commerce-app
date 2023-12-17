import 'package:e_commerce/config/cart/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductproviderLenceria extends ChangeNotifier{
final List<ProductModel> _lenceria = [
    ProductModel(
      name: "lenceria 4 partes",
      price: 43.75,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm8J3mQnyPV5m-iD60dZfCAZm7r37gtMIAlg&usqp=CAU',
      isAvailable: true,
    ),
    ProductModel(
      name: "lenceria estilo esclava ",
      price: 29.99,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJDNvvhZoyUM4fH1ignBTIftTzcxT7KpfsXV5X1hQ8OvMJgnTZkXmbIpLHIDhzBOz3gJQ&usqp=CAU",
      isAvailable: true,
    ),


     ProductModel(
      name: "lenceria estilo esclava ",
      price: 29.99,
      image:
          "assets/images/4.jpeg",
      isAvailable: true,
    ),
  ];
  List<ProductModel> get lencerias => _lenceria;

}
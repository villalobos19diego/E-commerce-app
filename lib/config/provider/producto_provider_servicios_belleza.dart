

  import 'package:e_commerce/config/cart/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductProviderServiciosBelleza  extends ChangeNotifier{


    

  final List<ProductModel> _servicio = [
    ProductModel(
      name: "lenceria tipo U",
      price: 24.65,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm8J3mQnyPV5m-iD60dZfCAZm7r37gtMIAlg&usqp=CAU",
      isAvailable: true, sizes: [], description: '',
    ),
    ProductModel(
      name: "lenceria tipo color negro",
      price: 26.55,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm8J3mQnyPV5m-iD60dZfCAZm7r37gtMIAlg&usqp=CAU",
      isAvailable: true, sizes: [], description: '',
    )
  ];
    List<ProductModel> get servicios => _servicio;
}  


  import 'package:e_commerce/config/cart/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductProviderServiciosBelleza  extends ChangeNotifier{


    

  final List<ProductModel> _servicio = [
    ProductModel(
      name: "lenceria tipo U",
      price: 24.65,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm8J3mQnyPV5m-iD60dZfCAZm7r37gtMIAlg&usqp=CAU",
      isAvailable: true,
      sizes: ["M", "L", "XL","S", "XXL"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m',
    ),
    ProductModel(
      name: "lenceria tipo color negro",
      price: 26.55,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm8J3mQnyPV5m-iD60dZfCAZm7r37gtMIAlg&usqp=CAU",
      isAvailable: true,
      sizes: ["M", "L", "XL","S", "XXL"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m',
    )
  ];
    List<ProductModel> get servicios => _servicio;
  void selectedSize(int index, String size){
    if(index >= 0 && index < _servicio.length){
      _servicio[index].selectedSize = size;
    }
  }
}  
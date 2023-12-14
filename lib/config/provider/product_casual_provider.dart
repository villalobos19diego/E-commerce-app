
   import 'package:e_commerce/config/cart/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCasualProvider extends  ChangeNotifier{
  final List<ProductModel> _casual = [
    ProductModel(
      name: "set completo de ropa de verano ",
      price: 50.75,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRDoEl6vJF_GhmGKpCuZvk7JWCYdiSH8_IsQ&usqp=CAU",
      isAvailable:  true, 
      sizes: ["M", "L", "XL","S"],
    ),
    ProductModel(
      name: "vestido casual",
      price: 21.99,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUn2CvK76JYJSLFp27DdOLqLhVKOhxhJs7Jg&usqp=CAU",
      isAvailable: true, 
      sizes: ["M", "L", "XL","S"],
    ),
    ProductModel(
      name: "SHEIN VCAY Vestido con estampado floral de espalda abierta con nudo fruncido tirantes",
      price: 22.99,
      image:
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR7PNUQJ3iC9gtal9WDaHdi696WCHRq2AFaC5xDODfbetJraM5PBnb_h0cb2_gA2IBTG7EQzzmTc1BdhRez6DUKg30YRaHViv79m44oYFZKtn6R9SiIzmFHsw&usqp=CAc",
      isAvailable: true,
      sizes: ["M", "L", "XL","S"],
    ),
    ProductModel(
      name: "SHEIN LUNE Blusa unicolor de manga obispo con fruncido",
      price: 0.00,
      image:
          "",
      isAvailable: true, sizes: ["M", "L", "XL","S"],
    ),

  ];
  List<ProductModel> get casuals => _casual;

  void selectedSize(int index, String size){
    if(index >= 0 && index < _casual.length){
      _casual[index].selectedSize = size;
    }
  }
}
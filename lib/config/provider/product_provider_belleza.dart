
import 'package:e_commerce/config/cart/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {


  final List<ProductModel> _belleza = [
    ProductModel(
      name: "lenceria color celeste de color ocean",
      price: 45.00,
      image:
          "https://i5.walmartimages.com/seo/Avidlove-Womens-Lingerie-Sets-with-Garters-Wedding-Lingerie-for-Bride-Ropa-Interior-Femenina-WhiteL_8a40a45f-8b4b-4f95-a1f2-31a828b1cb5e.b0f02a7cd3471d79f28226c9d5ade85d.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF",
      isAvailable: true,
    ),
    ProductModel(
      name: "lenceria casual",
      price:  34.00,
      image: "https://ae01.alicdn.com/kf/Sdf9761d17ca544249b92c698b47fbefcy/Sexy-Clothes-for-Woman-Mini-Lingerie-Mesh-Comfortable-Breathable-Slim-Fit-Lenceria-Femenina-Sexy-Garters-G.jpg",
      isAvailable: true,
    ),
  ];


 

  

  List<ProductModel> get bellezas => _belleza;


}

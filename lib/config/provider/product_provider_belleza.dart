
import 'package:e_commerce/config/cart/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {


  final List<ProductModel> _belleza = [
    ProductModel(
      name: "lenceria color celeste de color ocean",
      price: 45.00,
      image:
          "https://i5.walmartimages.com/seo/Avidlove-Womens-Lingerie-Sets-with-Garters-Wedding-Lingerie-for-Bride-Ropa-Interior-Femenina-WhiteL_8a40a45f-8b4b-4f95-a1f2-31a828b1cb5e.b0f02a7cd3471d79f28226c9d5ade85d.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF",
      isAvailable: false,
      sizes: ["M", "S", "L","XL", "XXL"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m',
    ),

    ProductModel(
      name: "lenceria casual Fenemina Color Amarrilo",
      price:  34.00,
      image: "https://ae01.alicdn.com/kf/Sdf9761d17ca544249b92c698b47fbefcy/Sexy-Clothes-for-Woman-Mini-Lingerie-Mesh-Comfortable-Breathable-Slim-Fit-Lenceria-Femenina-Sexy-Garters-G.jpg",
      isAvailable: true,
      sizes: ["M", "S", "L","XL", "XXL"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m',
    ),

    ProductModel(
      name: "lenceria casual Fenemina  Rojo",
      price:  45.90,
      image: "https://www.bing.com/th?id=OIP.JsMFO_99M5OL0pgwsoTdrgHaNK&w=150&h=267&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
      isAvailable: true,
      sizes: ["M", "S", "L","XL", "XXL"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m',
    ),


  ];


 

  

  List<ProductModel> get bellezas => _belleza;
  // Función para seleccionar una talla para un producto específico
  void selectSize(int index, String size) {
    if (index >= 0 && index < _belleza.length) {
      _belleza[index].selectedSize = size;
    }
  }

}

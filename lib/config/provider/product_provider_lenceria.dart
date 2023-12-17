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
      sizes: ["M", "L", "XL","S"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m',
    ),
    ProductModel(
      name: "lenceria estilo esclava ",
      price: 29.99,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJDNvvhZoyUM4fH1ignBTIftTzcxT7KpfsXV5X1hQ8OvMJgnTZkXmbIpLHIDhzBOz3gJQ&usqp=CAU",
      isAvailable: true, sizes: ["M", "L", "XL","S"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m',
    ),


     ProductModel(
      name: "lenceria estilo esclava ",
      price: 29.99,
      image:
          "assets/images/4.jpeg",
      isAvailable: true, sizes: ["M", "L", "XL","S"],
       description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m',
    ),
  ];
  List<ProductModel> get lencerias => _lenceria;
void selectSize(int index, String size) {
  if (index >= 0 && index < _lenceria.length) {
    _lenceria[index].selectedSize = size;
  }
}

}
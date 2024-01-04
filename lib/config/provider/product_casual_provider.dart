
   import 'package:e_commerce/config/cart/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCasualProvider extends  ChangeNotifier{
  final List<ProductModel> _casual = [
    ProductModel(
      name: "set completo de ropa de verano ",
      price: 50.75,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRDoEl6vJF_GhmGKpCuZvk7JWCYdiSH8_IsQ&usqp=CAU",
      isAvailable:   false, 
      sizes: ["M", "L", "XL","S", "XXL" ],
      description: '',
       quantity: 0,
        category: 'indefinied', 
      
       availableDeliveryLocations: ["Metrocentro","Plaza Venecia","Plaza Mundo" , "Galerias","Multiplaza"],
        selectedDeliveryLocation: ' default location',
        beautyServices: [], selectedBeautyService: '',

    ),
    ProductModel(
      name: "vestido casual",
      price: 21.99,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUn2CvK76JYJSLFp27DdOLqLhVKOhxhJs7Jg&usqp=CAU",
      isAvailable: true, 
      sizes: ["M", "L", "XL","S", "XXL"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m',
       category: 'indefined', 
       quantity: 0,
        selectedDeliveryLocation: ' default location',
        availableDeliveryLocations: [ "Metrocentro","Plaza Venecia","Plaza Mundo" , "Galerias","Multiplaza"],
        beautyServices: [], selectedBeautyService: '',
    ),
    ProductModel(
      name: "Vestido con estampado floral de espalda abierta con nudo fruncido tirantes",
      price: 22.99,
      image:
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR7PNUQJ3iC9gtal9WDaHdi696WCHRq2AFaC5xDODfbetJraM5PBnb_h0cb2_gA2IBTG7EQzzmTc1BdhRez6DUKg30YRaHViv79m44oYFZKtn6R9SiIzmFHsw&usqp=CAc",
      isAvailable: true,
      sizes: ["M", "L", "XL","S", "XXL"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m', category: '', quantity: 0,
       selectedDeliveryLocation: ' default location',
       availableDeliveryLocations: ["Metrocentro","Plaza Venecia","Plaza Mundo" , "Galerias","Multiplaza"],
       beautyServices: [], selectedBeautyService: '',
    ),
    ProductModel(
      name: "Set Casual ",
      price: 29.99,
      image:
          "assets/image/1.png",
      isAvailable: true, sizes:
    ["M", "L", "XL","S","XXL"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m', quantity: 0, category: '', 
      selectedDeliveryLocation: ' default location',
      availableDeliveryLocations: [ "Metrocentro","Plaza Venecia","Plaza Mundo" , "Galerias","Multiplaza"],
      beautyServices: [], selectedBeautyService: '',
    ),

  ];
  List<ProductModel> get casuals => _casual;

  void selectedSize(int index, String size){
    if(index >= 0 && index < _casual.length){
      _casual[index].selectedSize = size;
    }
  }

    void updateDeliveryLocation(ProductModel product, String deliveryLocation) {
  product. selectedDeliveryLocation  = deliveryLocation;
  notifyListeners();
}

}
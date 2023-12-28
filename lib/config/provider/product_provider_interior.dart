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
      isAvailable: true, sizes: ["M", "L", "XL","S", "XXL"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m',
       quantity: 0,
       category: 'idefinied',
        
         availableDeliveryLocations: ["Metrocentro","Plaza Venecia","Plaza Mundo" , "Galerias","Multiplaza"],
         
          selectedDeliveryLocation: 'default location',
    ),
    ProductModel(
      name: "Lenceria Interior",
      price: 26.77,
      image:
          "",
      isAvailable: true, sizes: ["M", "L", "XL","S", "XXL"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m',
       quantity: 0,
       category: 'idefinied',
        selectedDeliveryLocation: 'default location',
         availableDeliveryLocations: ["Metrocentro","Plaza Venecia","Plaza Mundo" , "Galerias","Multiplaza"],
    
    
    ),
    
    
    
    ProductModel(
      name: "Lencería color negro",
      price: 99.99,
      image:
          "",
      isAvailable: true, sizes: ["M", "L", "XL","S", "XXL"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m', 
      quantity: 0,
      category: '',
       selectedDeliveryLocation: 'default location',
        availableDeliveryLocations: ["Metrocentro","Plaza Venecia","Plaza Mundo" , "Galerias","Multiplaza"],

    ),
    
    
    
    ProductModel(
      name: "Lenceria Interior",
      price: 25.99,
      image:
          "",
      isAvailable: true,
      sizes: ["M", "L", "XL","S", "XXL"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m',
       category: '',
       quantity: 0,
        selectedDeliveryLocation: 'default location',
         availableDeliveryLocations: ["Metrocentro","Plaza Venecia","Plaza Mundo" , "Galerias","Multiplaza"],

    ),
    ProductModel(
      name: "Lenceria Interior",
      price: 129,
      image:
          "",
      isAvailable: true,
      sizes: ["M", "L", "XL","S", "XXL"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m',
    
     category: '',
     quantity: 0,
        selectedDeliveryLocation: 'default location',
       availableDeliveryLocations: ["Metrocentro","Plaza Venecia","Plaza Mundo" , "Galerias","Multiplaza"],
    ),
    
  ];
  void selectSize(int index, String size) {
    if (index >= 0 && index < _interior.length) {
      _interior[index].selectedSize = size;
    }
  }
  List<ProductModel> get interior => _interior;
}

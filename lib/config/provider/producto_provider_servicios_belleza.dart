

  import 'package:e_commerce/config/cart/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductProviderServiciosBelleza  extends ChangeNotifier{


    

  final List<ProductModel> _servicio = [
    ProductModel(
      name: "Peluquería",
      price: 00,
      image:
          "https://th.bing.com/th?id=OIP.J7-rP_jOHLR2h5CpdDzYFQHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
      isAvailable: true,
      sizes: ["M", "L", "XL","S", "XXL"],
      description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius m',
    category: '',
     quantity: 0,
       selectedDeliveryLocation: 'default location',
       availableDeliveryLocations: ["Metrocentro","Plaza Venecia","Plaza Mundo" , "Galerias","Multiplaza"],
        beautyServices: ["Corte de pelo"," Peinados", "Coloración", "tintes"],
         selectedBeautyService: '',
    
    ),
    ProductModel(
      name: "manicura Y Pedicura",
      price: 26.55,
      image:
          "https://th.bing.com/th?id=OIP.My_oeP7EfPux4ezRnrIdyQAAAA&w=235&h=265&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
      isAvailable: true,
      sizes: ["M", "L", "XL","S", "XXL"],
      description: ' Se puede ofrecer una amplia variedad de opciones, como uñas acrílicas, semipermanentes, diseños modernos o enfoques más orientados hacia la relajación y liberación de tensión ',
   category: '',
     quantity: 0,
    selectedDeliveryLocation: 'default location',
       availableDeliveryLocations: ["Metrocentro","Plaza Venecia","Plaza Mundo" , "Galerias","Multiplaza"],


       beautyServices: ["uñas acrílicas", "semipermanentes","semipermanentes"], selectedBeautyService: '',
    ),




     ProductModel(
      name: "Tratamientos  Faciales",
      price: 26.55,
      image:
          "https://www.bing.com/th?id=OIP.4Mzl8kAHildF_tWfx4triQHaE8&w=144&h=100&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
      isAvailable: true,
      sizes: ["M", "L", "XL","S", "XXL"],
      description: ' Se puede ofrecer una amplia variedad de opciones, como uñas acrílicas, semipermanentes, diseños modernos o enfoques más orientados hacia la relajación y liberación de tensión ',
   category: '',
     quantity: 0,
    selectedDeliveryLocation: 'default location',
       availableDeliveryLocations: ["Metrocentro","Plaza Venecia","Plaza Mundo" , "Galerias","Multiplaza"],
       beautyServices: ["tratamientos de spa, bronceado, drenaje linfático","tratamientos de reducción de peso,","tratamientos para la celulitis y muchos","limpieza facial", "exfoliación","mascarillas", "ratamientos nutritivos y tratamientos antiarrugas"], selectedBeautyService: '',
    ),
  
  ];

  
    List<ProductModel> get servicios => _servicio;
  void selectedSize(int index, String size){
    if(index >= 0 && index < _servicio.length){
      _servicio[index].selectedSize = size;
    }
    
  }
}  

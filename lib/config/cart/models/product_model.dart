
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

 class  ProductModel {
  final String id;
  final String name;
  final double price;
    final double quantity;
  final String image;
  final bool isAvailable;
  final List<String> sizes;
   late final  String selectedSize;
   String description;
    final String category;
     late String selectedDeliveryLocation;
   List<String> availableDeliveryLocations;

    final  List<String> beautyServices;
  String selectedBeautyService;
   

 


  ProductModel( {
    this.selectedSize = '',
    required this.name,
    required this.price,
    required this.image,
    required this.isAvailable,
    required this.sizes,
    required this.description,
    required this.quantity,
    required this.category ,
    required this.availableDeliveryLocations,
     required this.selectedDeliveryLocation,
      required this.beautyServices,
    required this.selectedBeautyService,
    

    
  




    
  }) : 
   id = uuid.v4();

  void selectBeautyService(String selectedService) {}

  



  
     

 // Map<String , dynamic> toJson(){
 //
 //  return{
 //
 //    'id': id,
 //      'name': name,
 //      'price': price,
 //      'image': image,
 //      'quantity': quantity,
 //      'selectedSize': selectedSize,
 //      'category': category,
 //
 //  };
 //
 // }


 
  }

  
 



 







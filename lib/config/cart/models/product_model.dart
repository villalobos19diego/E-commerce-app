
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

 class  ProductModel {
  final String id;
  final String name;
  final double price;
  final String image;
  final bool isAvailable;
  final List<String> sizes;
   late final  String selectedSize;

 


  ProductModel({
    this.selectedSize = '',
    required this.name,
    required this.price,
    required this.image,
    required this.isAvailable,
    required this.sizes,

    
  }) : id = uuid.v4();
 }




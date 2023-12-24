 import 'package:e_commerce/config/cart/models/product_model.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();


  class CartModel {

    final String id;
    final  ProductModel  product;
    int quantity;
    final String size;
    String selectedSize;
    final String selectedDeliveryLocation;
     final String availableDeliveryLocations;

    CartModel(  {
       required this.size,
       required this.product,
        required  this.quantity,
       required this.selectedSize,
       required this.selectedDeliveryLocation,
       required this.availableDeliveryLocations,
    
    }): id = uuid.v4();
  }



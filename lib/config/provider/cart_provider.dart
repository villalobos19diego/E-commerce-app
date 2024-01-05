

import 'dart:js';

import 'package:e_commerce/config/cart/models/cart_model.dart';
import 'package:e_commerce/config/cart/models/product_model.dart';
import 'package:e_commerce/screens/profile/Screen_Profile.dart';
import 'package:flutter/material.dart';



// class CartProvider extends ChangeNotifier {
//   final List<CartModel> _shoppingCart = [];

//   void addToCart(ProductModel product, String selectedSize,String selectedDeliveryLocation) {
    
    
    
    
    
//     var isExist = _shoppingCart.where
//       ((element) =>
//     element.product.id == product.id &&
//         element.selectedSize == selectedSize    &&
//         element.selectedDeliveryLocation ==
//             selectedDeliveryLocation);
//     if (isExist.isEmpty) {
//       _shoppingCart.add(CartModel(
//         product: product,
//         quantity: 1,
//         size: '',
//         selectedSize: selectedSize,
//        selectedDeliveryLocation:  selectedDeliveryLocation,
//         availableDeliveryLocations: '',
        
//       ));
//     } else {
//       isExist.first.quantity += 1;
//     }
//     notifyListeners();
//   }

//   void removeItem(String productId) {
//     _shoppingCart.removeWhere((element) => element.id == productId);
//     notifyListeners();
//   }

//   void incrementQty(String productId) {
//     CartModel item =
//         _shoppingCart.where((element) => element.id == productId).first;
//     item.quantity++;
//     notifyListeners();
//   }

//   void decrimentQty(String productId) {
//     CartModel item =
//         _shoppingCart.where((element) => element.id == productId).first;

//     if (item.quantity > 1) {
//       item.quantity--;
//     } else {
//       _shoppingCart.remove(item);
//     }
//     notifyListeners();
//   }

//   double getCartTotal() {
//     double total = 0;
//     for(var cartItem in _shoppingCart) {
//       total += (cartItem.product.price * cartItem.quantity);
//     }
//     return total;
//   }
  
//    double getTax() {
//     // Calcula el impuesto basado en el subtotal (ajusta la tasa de impuesto según sea necesario)
//     return getCartTotal() * 0.13; // Suponiendo una tasa de impuesto del 10%
//   }

//   List<CartModel> get shoppingCart => _shoppingCart;
//   double get cartSubTotal => getCartTotal();
//   double get shippingCharge => 0.25;
//    double get taxCharge => getTax();
//   double get cartTotal => cartSubTotal + shippingCharge  + taxCharge ;
// }

import 'package:firebase_auth/firebase_auth.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModel> _shoppingCart = [];

  void addToCart(ProductModel product, String selectedSize, String selectedDeliveryLocation, context) {
    if (isUserLoggedIn()) {
      var isExist = _shoppingCart.where((element) =>
        element.product.id == product.id &&
        element.selectedSize == selectedSize &&
        element.selectedDeliveryLocation == selectedDeliveryLocation);

      if (isExist.isEmpty) {
        _shoppingCart.add(CartModel(
          product: product,
          quantity: 1,
          size: '',
          selectedSize: selectedSize,
          selectedDeliveryLocation: selectedDeliveryLocation,
          availableDeliveryLocations: '',
        ));
      } else {
        isExist.first.quantity += 1;
      }
      notifyListeners();
    } else {ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(content: const Text('Debes iniciar sesion par agergar productos al carrrito.'),
       action: SnackBarAction(label: 'Iniciar Sesion', onPressed: () {
        Navigator.push(context , MaterialPageRoute(builder: (context) =>  const  ScreenProfile()));
         
       },),
      )
   
   
   
    );
     
     
    }
  }

  void removeItem(String productId) {
    _shoppingCart.removeWhere((element) => element.id == productId);
    notifyListeners();
  }

  void incrementQty(String productId) {
    CartModel item = _shoppingCart.where((element) => element.id == productId).first;
    item.quantity++;
    notifyListeners();
  }

  void decrimentQty(String productId) {
    CartModel item = _shoppingCart.where((element) => element.id == productId).first;

    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _shoppingCart.remove(item);
    }
    notifyListeners();
  }

  double getCartTotal() {
    double total = 0;
    for (var cartItem in _shoppingCart) {
      total += (cartItem.product.price * cartItem.quantity);
    }
    return total;
  }

  double getTax() {
    // Calcula el impuesto basado en el subtotal (ajusta la tasa de impuesto según sea necesario)
    return getCartTotal() * 0.13; // Suponiendo una tasa de impuesto del 10%
  }

  List<CartModel> get shoppingCart => _shoppingCart;
  double get cartSubTotal => getCartTotal();
  double get shippingCharge => 0.25;
  double get taxCharge => getTax();
  double get cartTotal => cartSubTotal + shippingCharge + taxCharge;

  bool isUserLoggedIn() {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}

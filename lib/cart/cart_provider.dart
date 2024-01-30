
import 'package:e_commerce/cart/product_provider.dart';
import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductProvider> _cartItems = [];
   int get itemCount => _cartItems.length;

  List<ProductProvider> get cartItems => _cartItems;

  void addToCart(ProductProvider product,  String selectedLocation, String selectedSize) {
   

       product.selectedLocation = selectedLocation;
    product.selectedSize = selectedSize;
   
    _cartItems.add(product);
    notifyListeners();
  }


  void removeFromCart(ProductProvider product,) {
    _cartItems.remove(product);

    notifyListeners();
  }

   Map<String, double> calculateOrderSummary() {
    double subtotal = 0.0;
    double shippingCost = 0.50; // Costo de envío (puedes ajustar este valor según tus necesidades)
    double taxRate = 0.13; // Tasa de impuestos (puedes ajustar este valor según tus necesidades)

    // Calcular el subtotal
    for (var item in _cartItems) {
      subtotal += item.price;
    }

    // Calcular el IVA
    double tax = subtotal * taxRate;

    // Calcular el total final
    double total = subtotal + shippingCost + tax;

    return {
      'subtotal': subtotal,
      'shippingCost': shippingCost,
      'tax': tax,
      'total': total,
    };
  }
}
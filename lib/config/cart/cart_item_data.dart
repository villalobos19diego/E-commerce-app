
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class CartItemData {
  final String id;
  final String name;
  final double price;
  final String image;
  final int quantity;
  final String selectedSize;

  final String category;

  final String selectedDeliveryLocation;

  CartItemData( {
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    required this.selectedSize,
    required this.category,
     required this.selectedDeliveryLocation,

  });

//   factory CartItemData.fromJson(Map<String, dynamic> json) {
//     return CartItemData(
//       id: json['id'],
//       name: json['name'],
//       price: json['price'],
//       image: json['image'],
//       quantity: json['quantity'],
//       selectedSize: '',
//       category: '',
//
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'price': price,
//       'image': image,
//       'quantity': quantity,
//       'selectedSize': selectedSize,
//       'category': category,
//     };
//   }
//
//   // Método para crear una nueva instancia con un nuevo ID
//   CartItemData copyWithNewId() {
//     return CartItemData(
//       id: Uuid().v4(),
//       name: name,
//       price: price,
//       image: image,
//       quantity: quantity,
//       selectedSize: selectedSize,
//       category: category,
//     );
//   }
// }
//
// // Ejemplo de uso
// void exampleUsage() {
//   // Crear instancias de CartItemData con diferentes categorías
//   var electronicsItem = CartItemData(
//     id: Uuid().v4(),
//     name: 'Smartphone',
//     price: 499.99,
//     image: 'https://example.com/smartphone.jpg',
//     quantity: 1,
//     selectedSize: 'M', category: '',
//
//   );
//
//   var clothingItem = CartItemData(
//     id: Uuid().v4(),
//     name: 'Camiseta',
//     price: 19.99,
//     image: 'https://example.com/tshirt.jpg',
//     quantity: 2,
//     selectedSize: 'L', category: '',
//
//   );
//
//   var booksItem = CartItemData(
//     id: Uuid().v4(),
//     name: 'Libro',
//     price: 29.99,
//     image: 'https://example.com/book.jpg',
//     quantity: 3,
//     selectedSize: 'N/A', category: '',
//
//   );
//
//   // Puedes agregar estos elementos a tu carrito de compras
//   List<CartItemData> shoppingCart = [electronicsItem, clothingItem, booksItem];
//
//   // Mostrar el contenido del carrito
//   for (var item in shoppingCart) {
//     print(item.toJson());
//   }
}
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.shopping_cart_rounded,
                size: 50,
                color: Color.fromARGB(255, 225, 190, 231),
              ),
              onPressed: () {},
            ),
            title: const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "shopping cart",
                style: TextStyle(color: Color.fromARGB(255, 225, 190, 231)),
              ),
            ),
            backgroundColor: const Color.fromARGB(216, 107, 45, 117),
          ),
    );
  }
}
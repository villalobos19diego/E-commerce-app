import 'package:e_commerce/navigations/Tabbar.dart';
import 'package:flutter/material.dart';

class CategoriesScreenTwo extends StatelessWidget {
  const CategoriesScreenTwo({super.key});

   @override
     Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: const Icon(
        Icons.apps,
        size: 40,
      ),
      title: const Text(
        'Nombre',
        style: TextStyle(
          fontSize: 40,
        ),
      ),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const Tabbar()),
            );
          }, 
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(216, 107, 45, 117),
            size: 40,
          )
          )
      ],
    ),
  );
}
}
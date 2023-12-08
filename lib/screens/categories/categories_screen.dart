import 'package:e_commerce/config/shop/shop_screen_belleza.dart';
import 'package:e_commerce/config/shop/shop_screen_casual.dart';
import 'package:e_commerce/config/shop/shop_screen_interior.dart';
import 'package:e_commerce/config/shop/shop_screen_lenceria.dart';
import 'package:e_commerce/config/shop/shop_screen_servicios_belleza.dart';
import 'package:flutter/material.dart';

class ScreenCategories extends StatelessWidget {
  const ScreenCategories({super.key}) ;

     @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            // leading: IconButton(
            //   icon: const Icon(
            //     Icons.apps,
            //     size: 50,
            //     color: Color.fromARGB(255, 225, 190, 231),
            //   ),
            //   onPressed: () {},
            // ),
            title: const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Categorias",
                style: TextStyle(color: Color.fromARGB(255, 225, 190, 231)),
              ),
            ),
            backgroundColor: const Color.fromARGB(216, 107, 45, 117),
          ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey[300],
            ),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Buscar',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                // Acción al cambiar el texto de búsqueda
              },
            ),
          ),
          Expanded(
            child: Center(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(20.0),
                childAspectRatio: 1.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: [
                  _CustomButton(
                    imagePath: 'assets/images/20.jpeg',
                    text: 'Lenceria',
                    onPressed: () {
                      // Acción al presionar el botón
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShopScreenLanceria()));
                    },
                  ),
                  _CustomButton(
                    imagePath: 'assets/images/28.jpeg',
                    text: 'belleza',
                    onPressed: () {
                      // Acción al presionar el botón
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShopScreen()));
                    },
                  ),
                  _CustomButton(
                    imagePath: 'assets/images/18.jpeg',
                    text: 'Ropa Interior',
                    onPressed: () {
                      // Acción al presionar el botón
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShopScreenInterior()));
                    },
                  ),
                  _CustomButton(
                    imagePath: 'assets/images/34.jpeg',
                    text: 'Casual',
                    onPressed: () {
                      // Acción al presionar el botón
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShopScreenCasual()));
                    },
                  ),
                  _CustomButton(
                    imagePath: 'assets/images/1.jpeg',
                    text: 'Servicios de belleza',
                    onPressed: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShopScreenServiciosBelleza()));


                    }
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;
  final double borderRadius; // Nueva propiedad

  const _CustomButton({
    required this.imagePath,
    required this.text,
    required this.onPressed,
    this.borderRadius = 5.0, // Valor predeterminado de 5.0
  });
 @override
  Widget build(BuildContext context) {
     return Material(
      borderRadius: BorderRadius.circular(borderRadius), // Utiliza la propiedad borderRadius
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius), // Utiliza la propiedad borderRadius
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius), // Utiliza la propiedad borderRadius
                  border: Border.all(color: Colors.black, width: 1.0), // Agrega un borde
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius), // Utiliza la propiedad borderRadius
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: 150, // Ajusta el tamaño de la imagen según tus necesidades
                    height: 250, // Ajusta el tamaño de la imagen según tus necesidades
                  ),
                ),
              ),
            ),
            const SizedBox(height: 1),
             Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              )
             )
             ]
        ),
      ),
    );
  }
}
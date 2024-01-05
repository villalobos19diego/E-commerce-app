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
           
            title: const Align(
              alignment: Alignment.bottomLeft,
              child: Center(
                child: Text(
                  "Categorias",
                  style: TextStyle(color: Color.fromARGB(255, 224, 51, 218)),
                ),
              ),
            ),
            backgroundColor: const Color.fromARGB(216, 107, 45, 117),
          ),
      body: Column(
        children: [
         
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
                    imagePath: 'assets/images/8.jpg',
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
                    imagePath: 'assets/images/33.jpg',
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
                    imagePath: 'assets/images/7.jpg',
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
                    imagePath: 'assets/images/77.jpg',
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
                  border: Border.all(color: const Color.fromARGB(255, 240, 41, 213), width: 1.0), // Agrega un borde
                ),
                child: ClipRRect(

                  borderRadius: BorderRadius.circular(borderRadius), // Utiliza la propiedad borderRadius

                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: 150, // Ajusta el tamaño de la imagen según tus necesidades
                    height: 350, // Ajusta el tamaño de la imagen según tus necesidades
                  ),

                ),
              ),
            ),
            const SizedBox(height: 1),
             Text(text , style: 
             const 
             TextStyle(   fontSize: 16,
                color: Color.fromARGB(255, 240, 41, 213)
                
              )
             )
             ]
        ),
      ),
    );
  }
}
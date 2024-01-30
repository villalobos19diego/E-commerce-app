import 'package:e_commerce/data/data_carousel_pointssales.dart';
import 'package:flutter/material.dart';


class AboutUs extends StatelessWidget {

  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar( 
        backgroundColor: const Color.fromARGB(216, 107, 45, 117),
        title: const Text('Acerca de nosotros'),
        titleTextStyle: const TextStyle(color: Colors.white,
        fontSize: 20),        
      ),
      body:  ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [                    
          //TEXTO DEL CARRUSEL PUNTOS DE VENTA
          Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 5),
            child: const Center(
              child: Text(
                'Puntos de venta',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: Colors.purple),
              ),
            ),
          ),

          //EMPIEZAN LOS CARRUSELES POPULARES
          const PuntoDeVenta()
        ],
        ),
    );
  }
}



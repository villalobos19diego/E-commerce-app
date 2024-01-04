import 'package:flutter/material.dart';

import 'package:e_commerce/widgets/barrabusqueda.dart';
import 'package:e_commerce/widgets/carruseles.dart';
import 'package:e_commerce/widgets/carruseles2.dart';
import 'package:e_commerce/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
 @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: const DrawerWidget(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('ParaTiSv',style: TextStyle(color: Color.fromARGB(255, 225,190, 231)),),
          backgroundColor: const Color.fromARGB(216, 107, 45, 117),
          actions: <Widget>[


            


          ],
        ),
        
        body: 
        SingleChildScrollView(          
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //BARRA BUSQUEDA
            const OurSearchBar(),
            //TEXTO DEL CARRUSEL
            Container(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 5),
              child: const Text(
                'Mas Populares',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
            ),
            //EMPIEZAN LOS CARRUSELES
            const CarruselView(),
            //TEXTO DEL CARRUSEL
            Container(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 5),
              child: const Text(
                'Liquidaciones',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
            ),
            //EMPIEZA CARRUSEL 2
            const CarruselView2(),
          // prueba imagenes de colecciones
          ],        
        ),
        ),
        
        
      );
  }





}


  

 
  


import 'package:e_commerce/config/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/searchbar.dart';
import 'package:e_commerce/widgets/gridcategories.dart';
import 'package:e_commerce/widgets/carouselpopulars.dart';
import 'package:e_commerce/widgets/carouseltops.dart';
import 'package:e_commerce/widgets/drawer.dart';

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
        title: const Text('ParaTiSv',style: TextStyle(color: Color.fromARGB(255, 240, 63, 199)),),
        backgroundColor: const Color.fromARGB(216, 107, 45, 117),
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 225,190, 231)), // Cambio del color del icono del Drawer aquí
        actions: <Widget>[
          IconButton(onPressed: () { Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartScreen())); }, 
                                icon: const Icon(Icons.shopping_cart ),
            
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          //BARRA BUSQUEDA
          const OurSearchBar(),
          //TEXTO DEL CARRUSEL POPULARES
          Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 5),
            child: const Text(
              'Mas  Populares',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
          ),

          //EMPIEZAN LOS CARRUSELES POPULARES
          const CarouselViewPops(),
          

          //TEXTO DEL CARRUSEL
          Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 5),
            child: const Text(
              'Liquidacion',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
          ),
          //EMPIEZA CARRUSEL 2
          const CarouselViewTops(),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
          ),


          //GRIDBUTTON QUE MUESTRA LAS CATEGORIAS

          const GridButton(),
        ],
      ),
    );
  }
}
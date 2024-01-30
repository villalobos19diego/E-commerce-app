



import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/cart/cart_provider.dart';
import 'package:e_commerce/cart/cart_screen.dart';
import 'package:e_commerce/cart/product_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsCasual extends StatefulWidget {
  final String productId;

  const ProductDetailsCasual({Key? key, required this.productId}) : 
  super(key: key);
  @override
  _ProductDetailsCasualState createState()
   => _ProductDetailsCasualState();
}

class _ProductDetailsCasualState extends State<ProductDetailsCasual> {
  DocumentSnapshot? productSnapshot;
  bool isLoading = true;
  String selectedSize = '';
    String selectedLocation = ''; 
     Timer? _timer;

  @override
  void initState() {
    super.initState();
    productSnapshot = null;

_timer  = Timer  (const Duration(seconds: 10), (){

  if(mounted) {

    setState(() {
      isLoading = false;
    });
  }

});
_loadProductDetails();
  }

  Future<void> _loadProductDetails() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('casual')
          .doc(widget.productId)
          .get();
  if(mounted){
    setState(() {
      



      productSnapshot = snapshot;
      isLoading = false;

    });

  }
     
     
    } catch (e){
      print('Error al cargar detalles del producto: $e');

    }
  }

  @override
  Widget build(BuildContext context) {
    if (productSnapshot == null) {
      return Center(
        child: isLoading
            ? const SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                ),
              )
            : const Text('Error De Carga'),
      );
    }

    var data = productSnapshot!.data() as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Producto' ,  style: TextStyle(color: Colors.purple)),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart , color:Colors.purple, ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 7,
                    child: Consumer<CartProvider>(
                      builder: (context, cart, child) {
                        return Text(
                          cart.itemCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 7,
                          
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Center(child: Column(    children: [
                  SizedBox(
                    width: 300,
                    height: 370,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child:  CachedNetworkImage(
             imageUrl: data['image'],
  errorWidget: (context, url, error) => const Text('Error al cargar la imagen'),
),
                    ),
                  ),

                     Padding(padding:  const EdgeInsets.all(16.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child:
                       Container(
                        margin:   const EdgeInsets.only(top: 8),
                        child:  Text(
                  'Nombre: ${data['name']}',
                 style: const TextStyle(
                        fontSize: 10.0,
                    fontWeight: FontWeight.bold,
              ),
            ),
             ),
             ),
             const SizedBox(height: 8, ),
                    const SizedBox(height: 8,),
                    Center(child: 
                      Text('Descripción: ${data['description']}',style: 
                      const TextStyle(fontSize: 10,color:Colors.purple),

                    ),

                      
                      ),

                      const SizedBox(height: 8,),
                      Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 8,right: 20),
                            child:  Text('Precio\$: ${data['price']}',
                            style: const TextStyle(fontSize: 14,color: Colors.purple,
                            fontWeight: FontWeight.bold
                            ),
                            ) ,
                          ),
                          Container(
                            margin:  const EdgeInsets.only(top: 8, left: 20),
                            child:Text('Disponibilidad: ${data['isAvailable'] ? 'Disponible' : 'No Disponible'}',
                            style: TextStyle(fontSize: 14,
                            color: data['isAvailable'] 
                                    ? const Color.fromARGB(255, 31, 208, 15)
                                   : const Color.fromARGB(255, 248, 73, 29),
                            fontWeight: FontWeight.bold ),
                               textAlign: TextAlign.center), 
                               ), ],
                               
                                ), ),
                               Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
         ElevatedButton.icon(
  onPressed: () {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Tallas:',
            style: TextStyle(
              color: Colors.purple,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: (data['sizes'] as String)
                .split(', ')
                .map((sizes) {
              return ListTile(
                title: Text(
                  sizes,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedSize = sizes;
                    Navigator.pop(context, sizes);
                  });
                },
              );
            }).toList(),
          ),
        );
      },
    );
  },
  icon: const Icon(Icons.add, size: 18 , color: Colors.purple), 
  label: Text(selectedSize.isEmpty ? 'Seleccionar talla' : selectedSize, style: 
  const TextStyle(color: Colors.purple)),
),
   const SizedBox(width: 16),

           ElevatedButton.icon(
  onPressed: () {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        // Verificar si data['deliveryLocation'] no es nula
        if (data['deliveryLocation'] != null) {
          return AlertDialog(
            title: const Text(
              'Ubicación de Entrega:',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: (data['deliveryLocation'] as String)
                  .split(', ')
                  .map((location) {
                return ListTile(
                  title: Text(
                    location,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedLocation = location;
                      String selectedSize = '';
                      Navigator.pop(context, location);
                    });
                  },
                );
              }).toList(),
            ),
          );
        } else {
          // Si data['deliveryLocation'] es nula, mostrar un mensaje o manejarlo de alguna manera
          return const AlertDialog(
            title: Text('Error'),
            content: Text('No se encontró información de ubicación de entrega.'),
          );
        }
      },
    );
  },
  icon:const  Icon(Icons.location_on, size: 18, color: Colors.purple,), // Puedes cambiar el ícono según tus necesidades
  label: Text(
    selectedLocation.isEmpty
        ? 'Seleccionar'
        : ': $selectedLocation',style:const  TextStyle(color:  Colors.purple),
  ),
)

                ],
                  ),],),)],),), ],
                       ),
                 Center(
        child:
  ElevatedButton(
    onPressed: () {
        // Usuario autenticado, agregar producto al carrito
        context.read<CartProvider>().addToCart(
          ProductProvider(
            id: widget.productId,
            name: data['name'],
            price: data['price'],
            deliveryLocation: selectedLocation,
            sizes: selectedSize,
            image: data['image'],
          ),
          selectedLocation,
          selectedSize,
        );

        // Mostrar SnackBar de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Producto agregado al carrito',
              style: TextStyle(color: Colors.purple),
            ),
            backgroundColor: Colors.white,
          ),
        );
    },
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.add_shopping_cart, color: Colors.purple),
        SizedBox(width: 8),
        Text('Agregar al Carrito', style: TextStyle(color: Colors.purple)),
      ],
    ),
  ),
),
     ], ), ),),);}}







  
         



    

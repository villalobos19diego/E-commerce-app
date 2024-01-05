




import 'package:e_commerce/config/cart/models/product_model.dart';

import 'package:e_commerce/config/provider/cart_provider.dart';
import 'package:e_commerce/screens/profile/Screen_Profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  final List<String> availableDeliveryLocations;



  const ProductDetailsScreen({super.key, required this.product, required this.availableDeliveryLocations });

  @override
  State<ProductDetailsScreen> createState()
  => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends
State<ProductDetailsScreen> {
  late String selectedSize;
  String selectedLocation = "Ubicaciones de Entrega";
  Future<void> _showLocationDialog() async {
    String? newLocation = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SimpleDialog(
            title: const Center(child: Text('Ubicación')),
            children: widget.product.availableDeliveryLocations.map((location) {
              return Center(
                child: SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, location);
                    
                  },
                  child: Text(location),
                ),
              );
            }).toList(),
          ),
        );
      },
    );

    if (newLocation != null) {
      setState(() {
        selectedLocation = newLocation;
      });
    }
  }




  void _showSizeDialog() async {
  String? selectedSize = await showDialog<String>(
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.product.sizes.map((size) {
            return ListTile(
              title: Text(
                size,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.pop(context, size);
              },
            );
          }).toList(),
        ),
      );
    },
  );

  if (selectedSize != null) {
    // Verificar si se ha seleccionado un lugar de entrega
    if (selectedLocation.isNotEmpty) {
      // Obtener la información del producto y la talla seleccionada
      String productInfo = 'Producto: ${widget.product.name}\n';
      productInfo += 'Descripción: ${widget.product.description}\n';
      productInfo += 'Precio: \$${widget.product.price.toString()}\n';
      productInfo += 'Talla seleccionada: $selectedSize\n';
      productInfo += 'Entrega En: $selectedLocation\n';

      // Lanzar la función para abrir WhatsApp con la información del producto
      await _launchWhatsApp(productInfo);
    } else {
      // Mostrar un mensaje indicando que se debe seleccionar un lugar de entrega
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, selecciona un lugar de entrega.'),
        ),
      );
    }
  }
}


  @override
  void initState() {
    super.initState();
    // Inicializar la talla seleccionada con la primera talla disponible
    selectedSize =
    widget.product.sizes.isNotEmpty ?
    widget.product.sizes[0] : "";
  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
         margin: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: 
                AlignmentDirectional.topStart,
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 370,
                          width: 300,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              widget.product.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                      Padding(
                       padding: const EdgeInsets.only(right: 20.0),
                       
                             child: IconButton(
                              icon: const Icon(Icons.arrow_back),
                               onPressed: () {
                        Navigator.pop(context);
                                      },
                           color: Colors.purple,
                        ),
                       ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child:
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Text(
                            widget.product.name,
                            style: const TextStyle(
                              color:Colors.purple,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 8, ),
                    const Center(child:
                    Text(  'Descripción:',
                      style: TextStyle(
                        color:Colors.purple,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    ),
                    const SizedBox(height: 8),
                    Center(

                        child:Text(widget.product.description,
                         style:
                        const TextStyle(fontSize:10, 
                        color:Colors.purple))
                    ),

             const SizedBox(height: 8),
Center(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: const EdgeInsets.only(top: 8, right: 20), // Ajusta el margen según sea necesario
        child: Text(
          'Precio: \$${widget.product.price.toString()}',
          style: const TextStyle(fontSize: 14, color: Colors.purple, 
          
            fontWeight: FontWeight.bold,),
         
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 8, left: 20), // Ajusta el margen según sea necesario
        child: Text(
          widget.product.isAvailable ? 'Disponible•' : 'No Disponible•',
          style: TextStyle(
            fontSize: 14,
            color: widget.product.isAvailable ?
             const Color.fromARGB(255, 31, 208, 15):
         const Color.fromARGB(255, 248, 73, 29),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  ),
),




                    const SizedBox(height: 8),
                    const Text(  'Tallas Disponibles:',
                      style: TextStyle(
                        color:Colors.purple,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,

                      ),
                    ),

                    const SizedBox(height: 8),
                    // Usar Wrap para mostrar botones redondos con las tallas disponibles
                    Center(
                      child:
                      Container(
                        margin: const EdgeInsets.only(top: 15,),
                        child: Column(
                          children: [

                            Wrap(
                              spacing: 20.0,
                              children: widget.product.sizes.map(
                                      (String size) {

                                    return ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          selectedSize = size;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: size == selectedSize ?
                                         Colors.purple : Colors.grey, // Color del botón
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0), // Radio de la esquina del botón
                                        ),
                                      ),
                                      child: Text(
                                        size,
                                        style: const TextStyle(
                                          color: Colors.white
                                          , // Color del texto
                                        ),
                                      ),
                                    );
                                  }).toList(),
                            ),
                          ],
                        ),
                      ),

                    ),
                   const SizedBox(height: 10),

// Botón para agregar al carrito
widget.product.isAvailable
    ? Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 44),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () async {
                  String? selectedSize = await showDialog<String>(
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
                          children: widget.product.sizes.map((size) {
                            return ListTile(
                              title: Text(
                                size,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context, size);
                              },
                            );
                          }).toList(),
                        ),
                      );
                    },
                  );

                  if (selectedSize != null) {
  // Verifica si el usuario está logeado antes de agregar al carrito
  if (context.read<CartProvider>().isUserLoggedIn()) {
    context.read<CartProvider>().addToCart(
      widget.product,
      selectedSize,
      selectedLocation,
      context
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 234, 171, 245).withOpacity(0.8),
        content: const Text(
          "Se Agregó al Carrito",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  } else {
    {ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(content: const Text('Debes iniciar sesion par agergar productos al carrrito.'),
       action: SnackBarAction(label: 'Iniciar Sesion', onPressed: () {
        Navigator.push(context , MaterialPageRoute(builder: (context) =>  const  ScreenProfile()));
         
       },),
      )
   
   
   
    );
     
     
    }
  }
}
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Container(
                       // margin: const EdgeInsets.only(top: 8, right: 25),
                        child: const Text(
                          'Agregar ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Ajusta la separación entre los botones según sea necesario
            const SizedBox(width: 8),

// Botón para pedir por WhatsApp con icono y texto
ElevatedButton(
  onPressed: () async {
     _showSizeDialog();
  },
  style: ElevatedButton.styleFrom(
    minimumSize: const Size(150, 50),
  ),
  child: const Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.shopping_cart_rounded,
        color: Color.fromARGB(255, 31, 208, 15),
      ),
      SizedBox(width: 8),
      Text(
        ' WhatsApp',
        style: TextStyle(color: Color.fromARGB(255, 31, 208, 15)),
      ),
    ],
  ),
),


            ],
          ),
        ),
      )
    : Container(),
           const SizedBox(height: 8),

// Botón para mostrar las ubicaciones de entrega disponibles
Center(
  child: ElevatedButton(
    onPressed: _showLocationDialog,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent, // Hace que el botón sea transparente
      elevation: 0, // Quita la sombra del botón
      minimumSize: const Size(100, 50), // Ajusta el ancho y alto mínimo del botón
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_on, color: Colors.purple),
        const SizedBox(width: 10),
        Text(
          selectedLocation,
          style: const TextStyle(color: Colors.purple),
        ),
      ],
    ),
  ),
),


                 
                 
              
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _launchWhatsApp(String message) async {
    // Número de teléfono para el destinatario
    String phoneNumber = '+50360670744';


    // Crear el enlace de WhatsApp
    String url = 'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

    // Abrir WhatsApp
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Manejar el caso en que WhatsApp no está instalado
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('WhatsApp no está instalado en tu dispositivo.'),
      ));
    }
  }


}

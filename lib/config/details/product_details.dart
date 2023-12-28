




import 'package:e_commerce/config/cart/models/product_model.dart';

import 'package:e_commerce/config/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
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
            title: const Text('Seleccionar Ubicación'),
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
          margin: const EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            widget.product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.purple,

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
                    const SizedBox(height: 8),
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

                        child:Text(widget.product.description, style:
                        const TextStyle(fontSize:16, color:Colors.purple))
                    ),

                    const SizedBox(height: 8),
                    Center(
                      child:
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Precio: \$${widget.product.price.toString()}',
                          style: const TextStyle(fontSize: 18, color: Colors.purple),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Producto:  '
                              '${widget.product.isAvailable ? 'Disponible•' : 'No Disponible•'}',
                          style: TextStyle(
                            fontSize: 14,
                            color: widget.product.isAvailable ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
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
                        margin: const EdgeInsets.only(top: 15),
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
                    //Botón para agregar al carrito
                    widget.product.isAvailable ?
                    GestureDetector(
                      onTap: () async {
                        String? selectedSize = await showDialog<String>(
                          context: context,
                          builder: (BuildContext context)   {
                            return AlertDialog(
                              title: const  Text('Tallas:',
                                style:
                                TextStyle(color:Colors.purple,
                                    fontSize: 13, 
                                    fontWeight: FontWeight.bold), ),
                              backgroundColor:Colors.white,
                              contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: widget.product.sizes.map((size) {
                                  return ListTile(
                                    title: Text(size, style: const  TextStyle(
                                      fontSize: 16, 
                                    ),),
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
                          context.read<CartProvider>().addToCart(
                            widget.product,
                            selectedSize,
                            selectedLocation, // Agregar selectedLocation
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.purple.withOpacity(0.8),
                              content: const Text(
                                "Se Agregó al Carrito",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        }

                      },
                      child:Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 44),
                          child: Container(
                            padding: const  EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.
                              circular(10),
                            ),
                            child:   Row (
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Iconsax.bag,
                                  size: 10,
                                  color: Colors.black,
                                ),
                                const SizedBox(width:15),

                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    child: const Text(
                                      'Seleccione Talla',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),




                              ],
                            ),
                          ),
                        ),
                      ),
                    ) :
                    Container(),

                    const SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                   
                        
                        
                        onPressed: ()  async {
                          // Obtener la información del producto y la talla seleccionada
                          String productInfo = 'Producto: ${widget.product.name}\n';
                          productInfo += 'Descripción: ${widget.product.description}\n';
                          productInfo += 'Precio: \$${widget.product.price.toString()}\n';
                          productInfo += 'Talla seleccionada: $selectedSize\n';
                          productInfo += 'Entrega En: $selectedLocation\n';
                    
                          //  ByteData bytes = await rootBundle.load(widget.product.image);
                          //   List<int> imageData = bytes.buffer.asUint8List();
                    
                    
                          //   await Share.file(
                          //   'Producto: ${widget.product.name}',
                          //   'product.jpg',
                          //   imageData,
                          //   'image/jpeg',
                          //   text: productInfo,
                          // );
                    
                          // Lanzar la función para abrir WhatsApp con la información del producto
                          await _launchWhatsApp(productInfo);
                        },
                        child:  const Text(
                       'Pedir Por Whatsapp', style: TextStyle
                       (color: Color.fromARGB(255, 31, 208, 15)),
                        ),
                      ),
                    ),
                     const SizedBox(height: 8),
                       const Center(
                         child: Text(
                                       'Puntos Disponibles:',
                                         style: TextStyle(
                                            color: Colors.purple,
                                         fontSize: 15,
                                         fontWeight: FontWeight.bold,
                                          ),
                                         ),
                       ),
                 const SizedBox(height: 10),
              // Muestra las ubicaciones de entrega disponibles
            Center(
        child: GestureDetector(
      onTap: _showLocationDialog,
        child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos horizontalmente
        children: [
          const Center(child: Icon(Icons.location_on,
           color: Colors.purple,)),
          const SizedBox(width: 10),
          Center(child: Text(selectedLocation, 
          style: const  TextStyle(color:Colors.purple),)),
        ],
      ),
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

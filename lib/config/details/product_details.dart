
import 'package:e_commerce/config/cart/models/product_model.dart';
import 'package:e_commerce/config/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;



  const ProductDetailsScreen({super.key, required this.product });

  @override
  State<ProductDetailsScreen> createState()
  => _ProductDetailsScreenState();
}
class _ProductDetailsScreenState extends
State<ProductDetailsScreen> {
  late String selectedSize;


  @override
  void initState() {
    super.initState();
    // Inicializar la talla seleccionada con la primera talla disponible
    selectedSize =
    widget.product.sizes.isNotEmpty ? widget.product.sizes[0] : "";
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
                              '${widget.product.isAvailable ? '|Disponible•|' : '|No Disponible•|'}',
                          style: TextStyle(
                            fontSize: 14,
                            color: widget.product.isAvailable ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    const Center(child:
                    Text(  'Tallas Disponibles:',
                      style: TextStyle(
                        color:Colors.purple,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,

                      ),
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
                                  backgroundColor: size == selectedSize ? Colors.purple : Colors.grey, // Color del botón
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
                                  fontSize: 13, // Ajusta el tamaño del título según tus necesidades
                                fontWeight: FontWeight.bold), ),
                              backgroundColor:Colors.white,
                              contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: widget.product.sizes.map((size) {
                                  return ListTile(
                                    title: Text(size, style: const  TextStyle(
                                      fontSize: 16, // Ajusta el tamaño del texto de la lista según tus necesidades
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
                          context
                              .read
                          <CartProvider>()
                              .addToCart
                            (widget.product,
                              selectedSize);
                          ScaffoldMessenger
                              .of(context)
                              .showSnackBar(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}


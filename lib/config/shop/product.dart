



import 'package:e_commerce/config/provider/cart_provider.dart';
import 'package:e_commerce/config/cart/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class Product extends StatefulWidget {
  final ProductModel product;

  const Product({
    super.key,
    required this.product,
  });

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: SizedBox(
        width: size.width * 0.50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: const Color(0xffF2F2F2),
                    color: Colors.purple,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white60.withOpacity(1),
                        spreadRadius: 0.5,
                        offset: const Offset(5, 5),
                      ),
                    ],
                  ),
                     child: Center(
                           child :ClipRRect(
                             borderRadius: BorderRadius.circular(10.0),
                             child: Image.network(

                      widget.product.image,
                      fit: BoxFit.cover,
                      width: 300,
                      height: 300,

                    ),
                    ),
                  ),
                ),
                // Positioned(
                //   //cajita del caiiro de compras el cul muestra
                //   // un mensaje al momento de agregar  un nuevo producto
                //   // al carrito de compras
                //   //contiene la logica que si el producto esta agotado no se muestre y
                //   //si esta disponible se pueda agregar el producto al carrito
                //   right: 8,
                //   top: 8,
                //   child: widget.product.isAvailable
                //       ? GestureDetector(
                //     onTap: () {
                //       String selectedSize = 'M';
                //       context
                //           .read<CartProvider>()
                //           .addToCart(widget.product, selectedSize);
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(
                //           backgroundColor:
                //           Colors.grey.withOpacity(0.8),
                //           content: const Text(
                //             "Se Agrego al Carrito",
                //             style: TextStyle(
                //               color: Colors.black,
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //     child: const CircleAvatar(
                //       backgroundColor: Colors.white,
                //       radius: 13,
                //       child: Icon(
                //         Iconsax.bag,
                //         size: 14,
                //       ),
                //     ),
                //   )
                //       : const SizedBox(),
                // ),
              ],
            ),
            //caja donde hace la peticion del 
            //nombre del producto
            SizedBox(
              height: size.height * 0.040,
            ),
            Center(
              child: Text(
                widget.product.name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.033,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            // SizedBox(
            //   child: widget.product.isAvailable
            //       ? Row(
            //     //muestre que el producto
            //     //esta disponible se podra agregar al carrito
            //
            //
            //     children: [
            //
            //       const CircleAvatar(
            //         backgroundColor: Color(0xff03B680),
            //         radius: 4,
            //       ),
            //       SizedBox(
            //         width: size.width * 0.020,
            //       ),
            //       Text(
            //         "Disponible",
            //         style: GoogleFonts.poppins(
            //           color: const Color(0xff03B680),
            //           fontSize: size.width * 0.031,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       )
            //     ],
            //   )
            //       : Row(
            //     //llamado que si el producto se agota se pase a prodcuto agotado
            //     //no se podra  agregar al carrito de compras
            //     children: [
            //       const CircleAvatar(
            //         backgroundColor: Colors.redAccent,
            //         radius: 4,
            //       ),
            //       SizedBox(
            //         width: size.width * 0.020,
            //       ),
            //       Text(
            //         "Producto No Disponible",
            //         style: GoogleFonts.poppins(
            //           color: Colors.redAccent,
            //           fontSize: size.width * 0.031,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            //llamado del precio de cada producto
            SizedBox(
              height: size.height * 0.003,
            ),
            Center(
              child: Text(
                "\$ ${widget.product.price}",
                style:
                GoogleFonts.poppins(
                    color: Colors.amber,
                    fontSize: size.width * 0.040),
              ),
            )
          ],
        ),
      ),
    );
  }
}
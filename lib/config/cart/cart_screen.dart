







import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import 'item_card.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
         // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.030,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Detalles Da La Orden",
                    style: GoogleFonts.poppins(
                      fontSize: size.width * 0.030,
                      fontWeight: FontWeight.w600,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.010,
            ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: context.watch<CartProvider>().shoppingCart.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Consumer<CartProvider>(
                              builder: (context, value,
                                  child) => Column(
                                children: value.shoppingCart
                                    .map(
                                      (cartItem) => CartItem(
                                        cartItem: cartItem,
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          ],
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height * 0.25,
                              ),
                              Icon(
                                Iconsax.bag,
                                size: size.width * 0.20,
                                color: Colors.purple,
                              ),
                              SizedBox(
                                height: size.height * 0.020,
                              ),
                              Text(
                                "El Carrito Esta Vacio",
                                style: GoogleFonts.poppins(
                                  color: Colors.purple,
                                ),
                              )
                            ],
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            SizedBox(

              child: context.watch<CartProvider>().shoppingCart.isNotEmpty ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total:",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.030,
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.010,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Total",
                        style: GoogleFonts.poppins(),
                        

                        
                    
                      ),
                      Text(
                        "\$${context.watch<CartProvider>().cartSubTotal}",
                        style: GoogleFonts.poppins(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.008,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cargo  De Envio",
                        style: GoogleFonts.poppins(),
                      ),
                      Text(
                        "+\$${context.watch<CartProvider>().shippingCharge}",
                        style: GoogleFonts.poppins(),
                      )
                    ],
                  ),
                     const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Impuesto:+13%",
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              "+\$${context.watch<CartProvider>().taxCharge.toStringAsFixed(2)}",
                              style: GoogleFonts.poppins(),
                            )
                          ],
                        ),   








                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                      "\$${double.parse(context.watch<CartProvider>().cartTotal.toStringAsFixed(2))}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.030,
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.055,
                    child: ElevatedButton(
                      onPressed: () async  
                {
                    

                   
                 },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Solicitar Productos(\$${double.parse(context.watch<CartProvider>().cartTotal.toStringAsFixed(2))})",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ),
                  )
                ],
              ) : Container()
              
            )
          ],
        ),
      ),
    );
  }

}



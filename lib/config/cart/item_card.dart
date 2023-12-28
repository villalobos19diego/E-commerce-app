import 'package:e_commerce/config/provider/cart_provider.dart';
import 'package:e_commerce/config/cart/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final CartModel cartItem;

  const CartItem({
    super.key,
    required this.cartItem,
  });


  @override
  State<CartItem> createState() => _CartItemState();
}


class _CartItemState extends State<CartItem> {
  Widget buildProductImage(Size size) {
    return Container(
      width: size.width * 0.30,
      height: size.height * 0.30,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Image.network(
          widget.cartItem.product.image,
          width: 180,
          height: 170,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget buildProductDetails(Size size) {
    return SizedBox(
      width: size.width * 0.30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.cartItem.product.name,
            style: GoogleFonts.poppins(
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.w500,
            ),
          ),
         // SizedBox(height: size.height * 0.005),
          Row(
            children: [
              Text(
                "\$${widget.cartItem.product.price}",
                style: GoogleFonts.poppins(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: size.width * 0.035,
                ),
              ),
              SizedBox(width: size.width * 0.020), // Ajusta según sea necesario
              // Texto de la talla
              Text(
                'Talla: ${widget.cartItem.selectedSize}',
                style: GoogleFonts.poppins(
                  fontSize: size.width * 0.030,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),



            ],
          ),

           SizedBox(height: size.width * 0.020),

          // Muestra la ubicación seleccionada por el usuario
          Text(
            'Entrega En : ${widget.cartItem.selectedDeliveryLocation}',
            style: GoogleFonts.poppins(
              fontSize: size.width * 0.030,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: size.width * 0.030),
          buildQuantitySelector(size),
          const SizedBox(width: 8),



        ],
      ),
    );
  }

  Widget buildQuantitySelector(Size size) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.read<CartProvider>().incrementQty(widget.cartItem.id);
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Iconsax.add,
              color: Colors.black,
              size: 14,
            ),
          ),
        ),
        const SizedBox(width: 13),
        Text(
          widget.cartItem.quantity.toString(),
          style: GoogleFonts.poppins(),
        ),
        const SizedBox(width: 13),
        GestureDetector(
          onTap: () {
            context.read<CartProvider>().decrimentQty(
                widget.cartItem.id);
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Iconsax.minus,
              color: Colors.black,
              size: 14,
            ),
          ),
        ),
        // const SizedBox(width: 20),
        // Text(
        //   'Talla: ${widget.cartItem.selectedSize}',
        //   style: GoogleFonts.poppins(
        //     fontSize: size.width * 0.030,
        //     color: Colors.black,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
      ],
    );
  }



  Widget buildDeleteButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CartProvider>().removeItem(widget.cartItem.id);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color.fromARGB(255, 247, 247, 247),
            content: Text(
              "Se Eliminó El Producto",
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      },
      child: CircleAvatar(
        backgroundColor: Colors.redAccent.withOpacity(0.07),
        radius: 20,
        child: const Icon(
          Iconsax.trash,
          color: Colors.redAccent,
          size: 18,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: size.width * 0.040),
          buildProductImage(size),

          Expanded(
             child: Padding(
               padding: const EdgeInsets.only(left:8),
               child:
               buildProductDetails(size),
             ),

          ),

          buildDeleteButton(context),

        ],
      ),
    );
  }
}

import 'package:e_commerce/config/cart/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

   const ProductDetailsScreen({super.key, required this.product });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}
class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late String selectedSize;

  @override
  void initState() {
    super.initState();
    // Inicializar la talla seleccionada con la primera talla disponible
    selectedSize = widget.product.sizes.isNotEmpty ? widget.product.sizes[0] : "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    widget.product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.black,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Precio: \$${widget.product.price.toString()}',
                    style: const TextStyle(fontSize: 18, color: Colors.green),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Producto: ${widget.product.isAvailable ? 'Disponible' : 'No disponible'}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  // Usar Wrap para mostrar botones redondos con las tallas disponibles
                  Wrap(
                    spacing: 8.0,
                    children: widget.product.sizes.map((String size) {
                      return ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: size == selectedSize ? Colors.amber : Colors.grey, // Color del botón
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0), // Radio de la esquina del botón
                          ),
                        ),
                        child: Text(
                          size,
                          style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}


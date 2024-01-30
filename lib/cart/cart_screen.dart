
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/cart/cart_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key });

  @override
  Widget build(BuildContext context) {
    var cartItems = context.watch<CartProvider>().cartItems;
     var orderSummary = context.read<CartProvider>().calculateOrderSummary();

    return Scaffold( appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.purple, size: 20),splashColor: Colors.amber,
          onPressed: () {
            // Navegar hacia atrás al presionar el botón de retroceso
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(onPressed: () {
            
          }, icon: const Icon(Icons.calendar_today, color: Colors.purple,))
        ],
      ),
     
      body: cartItems.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_checkout,
                    color: Colors.purple,
                    size: 50,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'El carrito está vacío',
                    style: TextStyle(fontSize: 18.0, color: Colors.purple),
                  ),
                ],
              ),
            )
          :ListView.builder(
  itemCount: cartItems.length,
  itemBuilder: (context, index) {
    var product = cartItems[index];
    return Padding(
       padding: const EdgeInsets.all(8.0), 
    
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.purple, width: 1), // Agrega bordes aquí
      //   borderRadius: BorderRadius.circular(10.0),
      // ),
     // Espaciado alrededor del contenedor
      child: ListTile(
      // Espaciado interno del ListTile
        leading: product.image != null
            ? 
     CachedNetworkImage(
      
  imageUrl: product.image!,
  fit: BoxFit.cover,
)

             
            : const SizedBox.shrink(),
        title: Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              'Precio: \$${product.price}',
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 217, 90, 232),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Ubicación de Entrega: ${product.deliveryLocation}',
              style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 4),
            Text(
              'Tallas disponibles: ${(product.sizes)}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            // Puedes agregar más detalles y estilos según tus necesidades
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.purple),
          onPressed: () {
            context.read<CartProvider>().removeFromCart(product);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Producto eliminado del carrito',
                  style: TextStyle(color: Colors.purple),
                ),
                backgroundColor: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  },
),

          
          bottomNavigationBar: Visibility(
        visible: cartItems.isNotEmpty,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(child: Text(  'Resumen de la Orden', style: TextStyle(color: Colors.white))),
                  const Divider(color: Colors.white),
                const SizedBox(height: 8),
                Text('SubTotal: \$${orderSummary['subtotal']?.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white)),
                Text('Costo De Envío: \$${orderSummary['shippingCost']?.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white)),
                Text('IVA: \$${orderSummary['tax']?.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white)),
                const Divider(color: Colors.white),
                Text('Total: \$${orderSummary['total']?.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para procesar la orden (por ejemplo, realizar el pago)
                    // Puedes agregar aquí la lógica que necesites para completar la orden
                  },
                  child: const Text('Procesar Orden', style: TextStyle(color: Colors.purple)),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
    

  
}

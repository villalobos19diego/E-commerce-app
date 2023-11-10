import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/producto.dart';
import 'package:e_commerce/screens/admin/producto/detalles_producto_page.dart';
import 'package:flutter/material.dart';

class ListaProductosPage extends StatefulWidget {
  const ListaProductosPage({super.key});

  @override
  State<ListaProductosPage> createState() => _ListaProductosPageState();
}

class _ListaProductosPageState extends State<ListaProductosPage> {
  List<Producto> productos = [];

  @override
  void initState() {
    super.initState();

    // Obtenemos los productos de la base de datos
    FirebaseFirestore.instance
        .collection('productos')
        .get()
        .then((querySnapshot) {
      productos = querySnapshot.docs.map((doc) {
        return Producto(
          foto: doc.data()['foto'],
          titulo: doc.data()['titulo'],
          descripcion: doc.data()['descripcion'],
          precio: doc.data()['precio'],
          categoria: doc.data()['categoria'],
        );        
      }).toList();

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de productos'),
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(productos[index].titulo),
            subtitle: Text(productos[index].descripcion),
            trailing: Text(productos[index].precio.toString()),
            leading:  Image.network(
              productos[index].foto,
              height: 500,
              width: 100,              
            ),
            onTap: () {
              // Navegamos a la pantalla de detalle
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalleProductoPage(
                    producto: productos[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

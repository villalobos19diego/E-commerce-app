import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/config/services/auth_service.dart';
import 'package:e_commerce/config/services/select_image.dart';
import 'package:e_commerce/config/services/upload_image.dart';
import 'package:e_commerce/models/producto.dart';
import 'package:flutter/material.dart';

class CrearProductoPage extends StatefulWidget {
  const CrearProductoPage({super.key});

  @override
  State<CrearProductoPage> createState() => _CrearProductoPageState();
}

class _CrearProductoPageState extends State<CrearProductoPage> {
  final _formKey = GlobalKey<FormState>();

  String _foto = '';
  String _titulo = '';
  String _descripcion = '';
  double _precio = 0.0;
  String _categoria = '';
  File? imagenToUpload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear producto'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const  EdgeInsets.all(10),
          children: [
            // Foto
            imagenToUpload != null
                ? Container(
                    margin: const EdgeInsets.all(10),
                    height: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(40)),
                    child: Image.file(imagenToUpload!),
                  )
                // si no hay imagen que muestre un icono de persona
                : Container(
                    margin: const EdgeInsets.all(10),
                    height: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(40)),
                    child: const Icon(
                      Icons.person,
                      size: 200,
                      color: Color.fromARGB(255, 225, 190, 231),
                    ),
                  ),
            ElevatedButton(
              child: const Text("Seleccionar Imagen"),
              onPressed: () async {
                final imagen = await getImage();
                setState(() {
                  imagenToUpload = File(imagen!.path);
                });
              },
            ),
            // Título
           // Título
TextFormField(
  decoration: InputDecoration(
    labelText: 'Título',
    icon: const Icon(Icons.title),
    fillColor: Colors.white,
    filled: true,
  ),
  onChanged: (value) {
    _titulo = value;
  },
),

// Descripción
TextFormField(
  decoration: InputDecoration(
    labelText: 'Descripción',
    icon: const Icon(Icons.description),
    fillColor: Colors.white,
    filled: true,
  ),
  onChanged: (value) {
    _descripcion = value;
  },
),

// Precio
TextFormField(
  
  decoration: InputDecoration(
    labelText: 'Precio',
    icon: const Icon(Icons.monetization_on),
    fillColor: Colors.white,
    filled: true,
    
  ),
  keyboardType: TextInputType.number,
  onChanged: (value) {
    _precio = double.parse(value);
  },
),

// Categoría
TextFormField(
  decoration: InputDecoration(
    labelText: 'Categoria',
    icon: const Icon(Icons.category),
    fillColor: Colors.white,
    filled: true,
  ),
  onChanged: (value) {
    _categoria = value;
  },
),

            // Botón de crear
            ButtonBar(
              children: [
                ElevatedButton(
                  child: const Text('Crear'),
                  onPressed: () async {
                    // Validamos el formulario
                    if (_formKey.currentState!.validate()) {
                      // Creamos el producto
                       _foto = await uploadImageProducto(imagenToUpload!);
                      Producto producto = Producto(
                        foto: _foto,
                        titulo: _titulo,
                        descripcion: _descripcion,
                        precio: _precio,
                        categoria: _categoria,
                      );                    
                      // Lo guardamos en la base de datos
                      await FirebaseFirestore.instance
                          .collection('productos')
                          .add({
                        'foto': producto.foto,
                        'titulo': producto.titulo,
                        'descripcion': producto.descripcion,
                        'precio': producto.precio,
                        'categoria': producto.categoria,
                      });

                      // Navegamos a la pantalla de lista
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

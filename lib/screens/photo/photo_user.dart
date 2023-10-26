import 'dart:io';

import 'package:e_commerce/config/services/auth_service.dart';
import 'package:e_commerce/config/services/select_image.dart';
import 'package:e_commerce/config/services/upload_image.dart';
import 'package:e_commerce/navigations/Tabbar.dart';
import 'package:flutter/material.dart';

class PhotoUser extends StatefulWidget {
  const PhotoUser({super.key});

  @override
  State<PhotoUser> createState() => _PhotoUserState();
}

class _PhotoUserState extends State<PhotoUser> {
  File? imagenToUpload;

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    final image = authService.getPhoto();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.person,
            size: 50,
            color: Color.fromARGB(255, 225, 190, 231),
          ),
          onPressed: () {},
        ),
        title: const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Log in",
            style: TextStyle(color: Color.fromARGB(255, 225, 190, 231)),
          ),
        ),
        backgroundColor: const Color.fromARGB(216, 107, 45, 117),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const Tabbar()));
          },
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(216, 107, 45, 117), size: 40),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 100,
          ),
          image != null
              ? Container(
                  margin: const EdgeInsets.all(10),
                  height: 200,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  child: Image.network(image),
                )
                // si no hay imagen que muestre un icono de persona 
              : Container(
                  margin: const EdgeInsets.all(10),
                  height: 200,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  child: Icon(
                    Icons.person,
                    size: 200,
                    color: Color.fromARGB(255, 225, 190, 231),
                  ),
                ),
          const SizedBox(
            height: 100,
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
          ElevatedButton(
            child: const Text("Subir Imagen"),
            onPressed: () async {
              if (imagenToUpload == null) {
                return;
              }
              final uploaded = await uploadImage(imagenToUpload!);
              if (uploaded) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Imagen Subida")));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Error al subir Imagen")));
              }
            },
          ),
        ]),
      ),
    );
  }
}

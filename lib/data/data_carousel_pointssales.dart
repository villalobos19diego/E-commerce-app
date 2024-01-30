  import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class PuntoDeVenta extends StatelessWidget {
  const PuntoDeVenta({super.key});

  @override
  Widget build(BuildContext context) {

return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('carrusel').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var documentos = snapshot.data!.docs;

          // Obtener las URLs de las imágenes
          List<String> urls = documentos.map((doc) => doc['image'] as String).toList();

         return CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              enlargeCenterPage: true,
                autoPlay: true, 
              autoPlayInterval:    const Duration(seconds: 2), 
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn, 
            ),
            items: urls.map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(15.0), // Ajusta el valor según tu preferencia
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0), // Ajusta el valor según tu preferencia
                      child: Image.network(url, fit: BoxFit.cover),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      );
   

  
  }
}
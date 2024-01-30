import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/cart/categories_firestone/casual/product_details_casual.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class CarouselViewTops extends StatelessWidget {
  const CarouselViewTops({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('casual').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        var documentos = snapshot.data!.docs;
        List<String> urls =
            documentos.map((doc) => doc['image'] as String).toList();

        return CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
          items: documentos.map((document) {
            var productId = document.id; // Aquí asignas el id del documento a productId

            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        document['image'] as String,
                        fit: BoxFit.cover,
                        height: 300,
                        width: 50,
                      ),
                    ),
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
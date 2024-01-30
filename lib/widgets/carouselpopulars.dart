import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class CarouselViewPops extends StatelessWidget {
  const CarouselViewPops({super.key});

  @override
  Widget build(BuildContext context) {
return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('lenceria').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: 
            CircularProgressIndicator());
          }

          var documentos = snapshot.data!.docs;

      
          List<String> urls = documentos.map((doc) => doc['image'] as String).toList();

         return CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              
              enlargeCenterPage: true,
               autoPlay: true,
              autoPlayInterval: const  Duration(seconds: 2),
              autoPlayAnimationDuration:  const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,

              
            ),
            items: urls.map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                 
                    
                  
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0), 
                      child: Image.network(url,  fit: BoxFit.cover, 
                        height: 300, width: 50),
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


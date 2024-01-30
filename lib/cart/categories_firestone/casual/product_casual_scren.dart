


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/cart/categories_firestone/casual/product_details_casual.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCasualScreen extends StatelessWidget {
  const ProductCasualScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('casual').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        var documents = snapshot.data!.docs;

        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            var document = documents[index];
           // var name = document['name'];
            var image = document['image'];
            var price = document['price'];
            var productId = document.id;

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsCasual(
                      productId: productId, 
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white60.withOpacity(1),
                                  spreadRadius: 0.5,
                                  offset: const Offset(5, 5),
                                ),
                              ],
                            ),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  image,
                                  width: 200,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 40,
                            left: 170,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   name,
                                //   style: GoogleFonts.poppins(
                                //     fontWeight: FontWeight.w500,
                                //     fontSize: MediaQuery.of(context).size.width * 0.020,
                                //     color: Colors.amber,
                                //   ),
                                // ),
                                const SizedBox(height: 5),
                                Text(
                                  'Price: $price',
                                  style: GoogleFonts.poppins(
                                    color: Colors.amberAccent,
                                    fontSize: MediaQuery.of(context).size.width * 0.020,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

    






  }

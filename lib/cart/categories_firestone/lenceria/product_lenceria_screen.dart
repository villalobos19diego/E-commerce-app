
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/cart/categories_firestone/lenceria/product_details_lenceria.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductLenceriaScreen extends StatelessWidget {
  const ProductLenceriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.purple, ),
          splashColor: Colors.white,
        
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        backgroundColor:  Colors.white
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('lenceria').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              var document = documents[index];
              var name = document['name'];
              var image = document['image'];
              var price = document['price'];
              var productId = document.id;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
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
                              height: 350,
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
                                    height: 350,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            // Positioned(
                            //   bottom: 40,
                            //   left: 170,
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         name,
                            //         style: GoogleFonts.poppins(
                            //           fontWeight: FontWeight.w500,
                            //           fontSize: MediaQuery.of(context).size.width * 0.025,
                            //           color: Colors.amberAccent,
                            //         ),
                            //       ),
                            //       const SizedBox(height: 5),
                            //       Text(
                            //         'Price: $price',
                            //         style: GoogleFonts.poppins(
                            //           color: Colors.amberAccent,
                            //           fontSize: MediaQuery.of(context).size.width * 0.025,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
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
      ),
    );
  }
}

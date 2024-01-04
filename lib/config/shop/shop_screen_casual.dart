import 'package:e_commerce/config/details/product_details.dart';
import 'package:e_commerce/config/provider/product_casual_provider.dart';
import 'package:e_commerce/config/shop/category_header.dart';
import 'package:e_commerce/config/shop/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreenCasual extends StatefulWidget{
  const ShopScreenCasual({super.key});

  @override
  State<ShopScreenCasual> createState() => _ShopScreenInteriorState();

}

 class _ShopScreenInteriorState  extends State<ShopScreenCasual>{
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;

  return  Scaffold(
    body: SingleChildScrollView(
       physics: const ScrollPhysics(),
       child: Padding(padding:
       const EdgeInsets.all(15.0),
       child: Column(
         crossAxisAlignment:
         CrossAxisAlignment.start,
         children: [
              
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.purple,
                splashColor: Colors.purple[400]

              ),
                     
                    ],
                  ),

                ],
              ),
           Column(

                 children: [  SizedBox(
                    height: size.height * 0.10,
                  ),
                  CategoryHeader(
                    title: 'Ropa Casual',
                    count:
                        '${Provider.of<ProductCasualProvider>(context).casuals.length}',
                  ),
                  SizedBox(
                    height: size.height * 0.10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Consumer<ProductCasualProvider>(
                      builder: (context, value, child)
                      => Column(
                        children: value.casuals
                            .map((product)
                        =>GestureDetector(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(
                               builder:(context) => ProductDetailsScreen(
                                 product: product, availableDeliveryLocations: [],
                               ),
                             ),
                             );
                           },
                          child: Padding(padding: const EdgeInsets.all(20),
                            child: Product(
                              product: product,
                            ),

                          ),
                        ),
                            )
                            .toList(),
                      ),
                    ),
                  ),],

              ),
              
              ],
       ),
      ),
    ),

  );
  }

 }
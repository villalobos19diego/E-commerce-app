




import 'package:e_commerce/config/details/product_details.dart';
import 'package:e_commerce/config/provider/product_provider_lenceria.dart';
import 'package:e_commerce/config/shop/category_header.dart';
import 'package:e_commerce/config/shop/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShopScreenLanceria extends StatefulWidget{
 const ShopScreenLanceria({super.key});

  @override
  State<ShopScreenLanceria> createState() => _ShopScreenLenceriaState();

}

 class _ShopScreenLenceriaState  extends State<ShopScreenLanceria>{
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;

  return  Scaffold(
    
    body: SingleChildScrollView(
       physics: const ScrollPhysics(),
       child: Padding(padding: const EdgeInsets.all(15.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [ SizedBox(
                height: size.height * 0.080,
                
              ),
              
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

                   children: [
                    SizedBox(
                    height: size.height * 0.10,
                  ),
                  
              CategoryHeader(
                    title: ' Ropa Lenceria',
                    count:
                        '${Provider.of<ProductproviderLenceria>(context).lencerias.length}',
                  ),
                  SizedBox(
                    height: size.height * 0.020,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Consumer<ProductproviderLenceria>(
                      builder: (context, value, child) => Column(
                        children: value.lencerias
                            .map((product) =>  GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(
                            builder:(context) => ProductDetailsScreen(
                            product: product, availableDeliveryLocations: [],
                            ),
                            ),);
                          },
                          child:Padding(padding: const EdgeInsets.all(20),
                          child: Product(
                            product:product
                          ),

                          ),
                        ),
                             
                            
                          )
                            .toList(),
                      ),
                    ),
                  ),


                  ],


              ),
              
              ],


       ),
      ),
  
    )



  );
  }

 }
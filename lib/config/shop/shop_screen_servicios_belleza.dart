

import 'package:e_commerce/config/details/product_details_servicio.dart';
import 'package:e_commerce/config/provider/producto_provider_servicios_belleza.dart';
import 'package:e_commerce/config/shop/category_header.dart';
import 'package:e_commerce/config/shop/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreenServiciosBelleza extends StatefulWidget{
 const ShopScreenServiciosBelleza({super.key});

  @override
  State<ShopScreenServiciosBelleza> createState() => _ShopScreenServiciosBellezaState();

}

 class _ShopScreenServiciosBellezaState extends State<ShopScreenServiciosBelleza>{
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;

  return  Scaffold(
    
    body: SingleChildScrollView(
       physics: const ScrollPhysics(),
       child: Padding(padding: const EdgeInsets.all(15.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
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

      children: [ 
        SizedBox(
                    height: size.height * 0.10,
                  ),
                  CategoryHeader(
                    title: 'Servicios De Belleza',
                    count:
                        '${Provider.of<ProductProviderServiciosBelleza>(context).servicios.length}', 
                  ),
                  SizedBox(
                    height: size.height * 0.020,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Consumer<ProductProviderServiciosBelleza>(
                      builder: (context, value, child) =>   Column(
                        children:   value.servicios
                            .map((product) =>
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder:( context)
                                => ProductDetailsService(product:product, availableDeliveryLocations: const [],)
                                )
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Product(product: product),
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
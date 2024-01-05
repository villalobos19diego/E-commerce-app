








import 'package:e_commerce/config/details/product_details.dart';
import 'package:e_commerce/config/provider/product_provider_belleza.dart';
import 'package:e_commerce/config/shop/category_header.dart';
import 'package:e_commerce/config/shop/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}
class _ShopScreenState extends State<ShopScreen> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: SingleChildScrollView(
        physics: const ScrollPhysics(),

        child: Padding(

          padding: const EdgeInsets.all(15.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
              

                icon: const Icon(Icons.arrow_back, color: Colors.purple ),
              
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.purple,
                splashColor: Colors.purple[400]

              ),
             
              Column(
                children: [
                 
                    SizedBox(
                            height: size.height * 0.15,  
                         ),
    
                  CategoryHeader(
                  title: 'Articulos De Belleza',  
                 count: '${Provider.of<ProductProvider>(context).bellezas.length}:' , 

                
                 
                  ), 
                  
                       

                  SizedBox(
                    height: size.height * 0.060,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Consumer<ProductProvider>(
                      builder: (context,
                          value, child) =>
                          Column
                        (
                         children: value.bellezas
                             .map(
                              (product)
                           => GestureDetector(
                             onTap: () {
                              Navigator.push(
                                   context,
                                MaterialPageRoute(
                                       builder: (context)
                                       =>
                                      ProductDetailsScreen(
                                        product: product, availableDeliveryLocations: const [],

                                      ),
                                ),
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
      ),
    );
  }
}

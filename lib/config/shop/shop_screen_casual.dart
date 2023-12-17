import 'package:e_commerce/config/provider/product_casual_provider.dart';
import 'package:e_commerce/config/shop/category_header.dart';
import 'package:e_commerce/config/shop/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
       child: Padding(padding: const EdgeInsets.all(15.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [ SizedBox(
                height: size.height * 0.0500,
                
              ),
              
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.030,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        "",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: size.width * 0.040,
                        ),
                      )
                    ],
                  ),
                   CircleAvatar(
                    radius: size.width * 0.030,
                    foregroundImage: const NetworkImage(
                      "https://i5.walmartimages.com.mx/mg/gm/3pp/asr/cbf7c4cd-fe28-4415-b958-4b098fbd30d4.3987f4fbd59ff83b1a4eb2f1dc9b895d.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF",
                    ),
                  )
                ],
              ),
               SizedBox(
                height: size.height * 0.020,
              ),
               SizedBox(
                width: size.width,
                child: TextFormField(
                  decoration: InputDecoration(
                    focusColor: Colors.black38,
                    isCollapsed: false,
                    hintText: "Buscar Productos",
                    prefixIcon: const Icon(Icons.search),
                    hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: size.width * 0.010,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.01,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:  const BorderSide(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                    
                  ),
                ),
              ),
                SizedBox(
                height: size.height * 0.015,
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
                      builder: (context, value, child) => Column(
                        children: value.casuals
                            .map((product) => Padding(padding: const EdgeInsets.all(20),
                         child: Product(
                                  product: product,
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
  
    )



  );
  }

 }
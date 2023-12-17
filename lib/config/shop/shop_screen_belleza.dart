








import 'package:e_commerce/config/details/product_details.dart';
import 'package:e_commerce/config/provider/product_provider_belleza.dart';
import 'package:e_commerce/config/shop/category_header.dart';
import 'package:e_commerce/config/shop/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.purple,

              ),
              SizedBox(
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
                          fontSize: size.width * 0.050,
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
                    radius: size.width * 0.080,
                    foregroundImage: const NetworkImage(
                      "https://i5.walmartimages.com.mx/mg/gm/3pp/asr/cbf7c4cd-fe28-4415-b958-4b098fbd30d4.3987f4fbd59ff83b1a4eb2f1dc9b895d.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF",
                    ),
                  )
                ],
              ),
                 SizedBox(
                height: size.height * 0.050,
              ),

              SizedBox(
                height: size.height * 0.050,
              ),
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.040,
                  ),
                  CategoryHeader(
                    title: 'Articulos De Belleza',
                    count:
                    '${Provider.of<ProductProvider>(context).bellezas.length}',
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
                                        product: product,

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

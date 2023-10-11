import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/data/data_carousel_pop.dart';
import 'package:e_commerce/models/carouselpop_model.dart';
import 'package:e_commerce/widgets/show_carousel_pop.dart';

class CarouselViewPops extends StatelessWidget {
  const CarouselViewPops({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        CarouselSlider.builder(
          itemCount: carouselImagesPopular.length,
          itemBuilder: ((context, index, realIndex) {
            //Dice que no se usa pero si se usa, NO TOCAR
            final carouselImagePopular = carouselImagesPopular[index];
            return CardImages(
              carouselImages: carouselImagesPopular[index],
            );
          }),
          options: CarouselOptions(
            height: 400.0,
            autoPlay: true,
            autoPlayCurve: Curves.easeInOut,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(seconds: 5),
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}

class CardImages extends StatelessWidget {
  final CarouselPops carouselImages;
  const CardImages({super.key, required this.carouselImages});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            carouselImages.copy();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ShowCarouselPop(carouselImages: carouselImages,)));
          },
          child: FadeInImage(
            placeholder: const AssetImage("assets/images/34.jpeg"),
            image: AssetImage(carouselImages.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderImages extends StatelessWidget {
  const CarouselSliderImages(
      {Key? key, items, options, required this.imageLocation})
      : super(key: key);

  final String imageLocation;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        sliderImages(
          imageLocation,
        ),
        sliderImages(
          imageLocation,
        ),
        sliderImages(
          imageLocation,
        ),
        sliderImages(
          imageLocation,
        ),
      ],
      options: CarouselOptions(
        height: 250.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }

  Widget sliderImages(String imageLocation) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(imageLocation),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

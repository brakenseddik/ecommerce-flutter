import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

Widget carouselSlider(items) => SizedBox(
      height: 200,
      child: Carousel(
        images: items,
        boxFit: BoxFit.cover,
        autoplay: true,
        dotColor: Colors.deepOrangeAccent,
        dotSize: 8.0,
        dotBgColor: Colors.transparent,
      ),
    );

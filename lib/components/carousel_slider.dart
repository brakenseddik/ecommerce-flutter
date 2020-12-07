import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

Widget carouselSlider(items) => SizedBox(
      height: 200,
      child: Carousel(
        images: items,
        boxFit: BoxFit.cover,
        // autoplay: true,
        dotBgColor: Colors.transparent,
        showIndicator: true,
        overlayShadow: true,
        overlayShadowColors: Colors.white,
        overlayShadowSize: 0.7,
      ),
    );

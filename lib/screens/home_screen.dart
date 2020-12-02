import 'dart:convert';

import 'package:ecommerce_api/components/carousel_slider.dart';
import 'package:ecommerce_api/services/slider_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SliderService _sliderService = SliderService();
  List _items = [];

  getCategories() async {
    var url = 'http://192.168.1.3:8000/';
    var sliders = await _sliderService.getSliders();
    var result = jsonDecode(sliders.body);
    if (result != null) {
      result['data'].forEach((slider) {
        String imageUrl = slider['image_url'];
        String img = imageUrl.substring(22, imageUrl.length);
        String image = url + img;
        setState(() {
          _items.add(NetworkImage(image));
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: ListView(
          children: [carouselSlider(_items)],
        ));
  }
}

import 'dart:convert';

import 'package:ecommerce_api/components/carousel_slider.dart';
import 'package:ecommerce_api/components/hot_products.dart';
import 'package:ecommerce_api/components/product_categories.dart';
import 'package:ecommerce_api/constants/constants.dart';
import 'package:ecommerce_api/models/category.dart';
import 'package:ecommerce_api/models/product.dart';
import 'package:ecommerce_api/services/category_service.dart';
import 'package:ecommerce_api/services/product_service.dart';
import 'package:ecommerce_api/services/slider_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //SERVICES
  SliderService _sliderService = SliderService();
  CategoryService _categoryService = CategoryService();
  ProductService _productService = ProductService();

  //LISTS
  List _items = [];
  List<CategoryModel> _categoryList = List<CategoryModel>();
  List<ProductModel> _productList = List<ProductModel>();

  _getAllSliders() async {
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

  _getAllCategories() async {
    var url = 'http://192.168.1.3:8000/';
    var categories = await _categoryService.getCategories();
    var result = jsonDecode(categories.body);
    if (result != null) {
      result['data'].forEach((category) {
        CategoryModel categoryModel = CategoryModel();
        categoryModel.id = category['id'];
        categoryModel.name = category['name'];
        String image = category['icon'];
        String img = image.substring(22, image.length);
        categoryModel.icon = url + img;

        setState(() {
          _categoryList.add(categoryModel);
        });
      });
    }
  }

  _getAllHotProducts() async {
    var url = 'http://192.168.1.3:8000/';
    var products = await _productService.getHotProducts();
    var result = jsonDecode(products.body);
    if (result != null) {
      result['data'].forEach((product) {
        ProductModel productModel = ProductModel();
        productModel.id = product['id'];
        productModel.name = product['name'];
        productModel.price = product['price'];
        productModel.discount = product['discount'];
        String image = product['image'];
        String img = image.substring(22, image.length);
        productModel.image = url + img;

        setState(() {
          _productList.add(productModel);
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getAllSliders();
    _getAllCategories();
    _getAllHotProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Home'),
        ),
        body: ListView(
          children: [
            carouselSlider(_items),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Explore Categories',
                style: kHomeTitle,
              ),
            ),
            ProductCategories(
              categories: _categoryList,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Hot Products',
                style: kHomeTitle,
              ),
            ),
            HotProducts(
              products: _productList,
            )
          ],
        ));
  }
}

import 'dart:convert';

import 'package:ecommerce_api/services/category_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryService _categoryService = CategoryService();

  getCategories() async {
    var categories = await _categoryService.getCategories();
    var result = json.decode(categories.body);
    print(result);
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
      body: Center(
        child: Text('Hello everyone !!'),
      ),
    );
  }
}

import 'dart:convert';

import 'package:ecommerce_api/components/product_card.dart';
import 'package:ecommerce_api/config/config.dart';
import 'package:ecommerce_api/models/product.dart';
import 'package:ecommerce_api/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProducsByCategoryScreen extends StatefulWidget {
  final String categoryName;
  final int id;
  ProducsByCategoryScreen({this.id, this.categoryName});
  @override
  _ProducsByCategoryScreenState createState() =>
      _ProducsByCategoryScreenState();
}

class _ProducsByCategoryScreenState extends State<ProducsByCategoryScreen> {
  ProductService _productService = ProductService();
  List<ProductModel> _list = List<ProductModel>();

  _getProductsByCategory() async {
    var url = 'http://192.168.1.2:8000/';
    var products = await _productService.getProductsByCategory(widget.id);
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
          _list.add(productModel);
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getProductsByCategory();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryName),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: _list.length > 0
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 3.0,
                      crossAxisSpacing: 4.0,
                      childAspectRatio: (150 / 180)),
                  itemBuilder: (context, index) {
                    return NewProductCard(
                      product: _list[index],
                    );
                  },
                  itemCount: _list.length,
                )
              : Center(
                  child: Text(
                    'No product listed in ${this.widget.categoryName} !!',
                    style: TextStyle(fontSize: getProportionateScreenWidth(18)),
                  ),
                ),
        ));
  }
}

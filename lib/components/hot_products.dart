import 'package:ecommerce_api/components/hot_product_card.dart';
import 'package:ecommerce_api/models/product.dart';
import 'package:flutter/material.dart';

class HotProducts extends StatefulWidget {
  final List<ProductModel> products;
  HotProducts({this.products});
  @override
  _HotProductsState createState() => _HotProductsState();
}

class _HotProductsState extends State<HotProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      margin: EdgeInsets.all(8.0),
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return HotProductCard(
            productModel: widget.products[index],
          );
        },
        itemCount: widget.products.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

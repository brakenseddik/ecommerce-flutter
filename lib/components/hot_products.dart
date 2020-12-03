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
      child: ListView.builder(
        itemBuilder: (context, index) {
          return HotProductCard(
            this.widget.products[index].name,
            this.widget.products[index].image,
            this.widget.products[index].price,
            this.widget.products[index].price -
                this.widget.products[index].discount,
          );
        },
        itemCount: widget.products.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

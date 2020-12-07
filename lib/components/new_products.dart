import 'package:ecommerce_api/components/product_card.dart';
import 'package:ecommerce_api/models/product.dart';
import 'package:flutter/material.dart';

class NewProducts extends StatefulWidget {
  final List<ProductModel> products;
  NewProducts({this.products});
  @override
  _NewProductsState createState() => _NewProductsState();
}

class _NewProductsState extends State<NewProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 3.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: (150 / 180)),
        itemBuilder: (context, index) {
          return NewProductCard(
            product: widget.products[index],
          );
        },
        itemCount: widget.products.length,
        //scrollDirection: Axis.horizontal,
      ),
    );
  }
}

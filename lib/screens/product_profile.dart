import 'package:ecommerce_api/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel product;

  ProductDetail(this.product);
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.product.name),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Container(
                  child: Image.network(
                    this.widget.product.image,
                    width: double.infinity,
                    height: 250.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              footer: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  this.widget.product.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Text(
                  'Price:${this.widget.product.price}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.bold),
                )),
                Text(
                  'Now: ${this.widget.product.price.floor() - this.widget.product.discount.floor()}',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  textColor: Colors.redAccent,
                  child: Row(
                    children: <Widget>[
                      Text('Add to cart'),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.redAccent,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

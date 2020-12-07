import 'package:ecommerce_api/constants/constants.dart';
import 'package:ecommerce_api/models/product.dart';
import 'package:ecommerce_api/screens/product_profile.dart';
import 'package:flutter/material.dart';

class NewProductCard extends StatefulWidget {
  final ProductModel product;

  NewProductCard({this.product});

  @override
  _NewProductCardState createState() => _NewProductCardState();
}

class _NewProductCardState extends State<NewProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(this.widget.product)));
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        child: Card(
          elevation: 2.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7), topRight: Radius.circular(7)),
                child: Image.network(
                  this.widget.product.image,
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 4.0, left: 4.0, right: 4.0),
                child: Text(
                  this.widget.product.name,
                  style: kIconCardName.copyWith(fontSize: 16),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 8.0, right: 8.0, left: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "£" + widget.product.price.toString(),
                        style: KpriceTitle,
                      ),
                    ),
                    Text("£" +
                        (widget.product.price - widget.product.discount)
                            .floor()
                            .toString())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

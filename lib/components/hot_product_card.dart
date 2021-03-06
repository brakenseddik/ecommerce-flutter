import 'package:ecommerce_api/config/config.dart';
import 'package:ecommerce_api/constants/constants.dart';
import 'package:ecommerce_api/models/product.dart';
import 'package:ecommerce_api/screens/product_profile.dart';
import 'package:flutter/material.dart';

class HotProductCard extends StatefulWidget {
  final ProductModel productModel;
  HotProductCard({this.productModel});

  @override
  _HotProductCardState createState() => _HotProductCardState();
}

class _HotProductCardState extends State<HotProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(this.widget.productModel)));
      },
      child: Container(
        height: 150,
        width: 170,
        child: Card(
          elevation: 2.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7), topRight: Radius.circular(7)),
                child: Image.network(
                  this.widget.productModel.image,
                  height: 130,
                  width: 170,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 8.0, left: 4.0, right: 4.0),
                child: Text(
                  this.widget.productModel.name,
                  style: kIconCardName.copyWith(
                      fontSize: getProportionateScreenWidth(16)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 8.0, right: 8.0, left: 8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "£" + widget.productModel.price.toString(),
                      style: KpriceTitle,
                    )),
                    Text("£" +
                        (widget.productModel.price -
                                widget.productModel.discount)
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

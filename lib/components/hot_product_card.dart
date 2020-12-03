import 'package:ecommerce_api/constants/constants.dart';
import 'package:flutter/material.dart';

class HotProductCard extends StatefulWidget {
  final String productName, productImage;
  double productPrice, productDiscount;
  HotProductCard(this.productName, this.productImage, this.productPrice,
      this.productDiscount);

  @override
  _HotProductCardState createState() => _HotProductCardState();
}

class _HotProductCardState extends State<HotProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 130,
      child: Card(
        elevation: 2.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7), topRight: Radius.circular(7)),
              child: Image.network(
                this.widget.productImage,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 8.0, left: 4.0, right: 4.0),
              child: Text(
                this.widget.productName,
                style: kIconCardName.copyWith(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "£" + widget.productPrice.toString(),
                    style: KpriceTitle,
                  )),
                  Text("£" + widget.productDiscount.toString())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

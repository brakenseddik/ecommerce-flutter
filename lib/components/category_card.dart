import 'package:ecommerce_api/constants/constants.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final String categoryName, categoryIcon;
  CategoryCard({this.categoryName, this.categoryIcon});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              this.widget.categoryIcon,
              height: 75,
              width: 75,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                this.widget.categoryName,
                style: kIconCardName,
              ),
            )
          ],
        ),
      ),
    );
  }
}

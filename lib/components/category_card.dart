import 'package:ecommerce_api/config/config.dart';
import 'package:ecommerce_api/constants/constants.dart';
import 'package:ecommerce_api/screens/products_bycategory_screen.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final String categoryName, categoryIcon;
  final int id;
  CategoryCard({this.id, this.categoryName, this.categoryIcon});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProducsByCategoryScreen(
                        id: widget.id,
                        categoryName: widget.categoryName,
                      )));
        },
        child: Card(
          elevation: 2.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                this.widget.categoryIcon,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  this.widget.categoryName,
                  style: kIconCardName.copyWith(
                      fontSize: getProportionateScreenWidth(16)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

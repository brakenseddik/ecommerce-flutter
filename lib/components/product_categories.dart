import 'package:ecommerce_api/components/category_card.dart';
import 'package:ecommerce_api/models/category.dart';
import 'package:flutter/material.dart';

class ProductCategories extends StatefulWidget {
  final List<CategoryModel> categories;
  ProductCategories({this.categories});
  @override
  _ProductCategoriesState createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return CategoryCard(
            categoryIcon: widget.categories[index].icon,
            categoryName: widget.categories[index].name,
          );
        },
        itemCount: widget.categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

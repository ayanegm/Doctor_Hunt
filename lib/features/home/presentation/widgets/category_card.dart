import 'package:doctor_hunt/features/home/data/models/category_model.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      // height: 0.110 * screenHeight,
      width: 0.210 * screenWidth,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: categoryModel.color,
      ),
      child: Center(
        child: Icon(
          categoryModel.iconData,
          color: Colors.white,
          size: screenWidth * 0.08,
        ),
      ),
    );
  }
}

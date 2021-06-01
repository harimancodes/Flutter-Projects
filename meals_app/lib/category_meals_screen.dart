import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import 'models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final List<Meal> categoryMeals;
  CategoryMealsScreen(this.categoryId, this.categoryTitle)
      : categoryMeals = DUMMY_MEALS.where((meal) {
          return meal.categories.contains(categoryId);
        }).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

 // void _removeMeal(String mealId) {
  //  setState(() {
  //    displayedMeals.removeWhere((meal) => meal.id == mealId);
  //  });
  // }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,
          String>; // here we extract the arguments given by pushNamed in category_item file
      categoryTitle = routeArgs['title'];

      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        // here we filtered out meals based on id, and id is different for each food category
        return meal.categories.contains(
            categoryId); // and so we get a list categoryMeals which contains all meals belonging to that id
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        // and now here we are displaying the above created list categoryMeals
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}

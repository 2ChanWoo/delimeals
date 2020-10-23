import 'package:delimeals/models/meal.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = '/meal-detail';
  List<Meal> favoriteMeals;

  MealDetailScreen(this.favoriteMeals);

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    final mealId = ModalRoute.of(context).settings.arguments as String;
    print('mealID $mealId');
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    print('selectedMeal ${selectedMeal.id}');
    bool isFavorite;
    if(widget.favoriteMeals.length > 0)
      isFavorite = widget.favoriteMeals.firstWhere((meal) => meal.id == mealId) != null;
    else
      isFavorite = false;
    print('build  $isFavorite');


    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingredients[index])),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite ? Icons.favorite_border : Icons.favorite),
        onPressed: () {
          setState(() {
            print(widget.favoriteMeals.length);

            isFavorite
                ? widget.favoriteMeals.remove(selectedMeal)
                : widget.favoriteMeals.add(selectedMeal);
            isFavorite = !isFavorite;

            for( Meal a in widget.favoriteMeals) {
              print('${a.id}');
            }
            print(isFavorite);
            print(widget.favoriteMeals.length);
          });
        },
      ),
    );
  }
}

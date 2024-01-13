import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/model/widgets/meal_item.dart';
import 'package:meals/screens/meal_details.dart';

class MealsScreen extends StatelessWidget{
   const  MealsScreen({super.key,
     this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;


  void selectMeal(BuildContext context,Meal meal){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx,index) => MealItem(meal: meals[index],onSelectMeal: selectMeal,)
    );

    if(meals.isEmpty) {
      content =  Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
         Text('Uh oh..... Nothing Here!.',
             style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,),
        ),
        const SizedBox(height: 16),
        Text(
            'Try Selecting a different Category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,),
        )
      ],
      ),
      );
    }

     if(title == null){
       return content;
     }

   return Scaffold(
     appBar: AppBar(
       title:  Text(title!),
     ),
     body: content,
   );
  }
}
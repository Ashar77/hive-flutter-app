import 'package:flutter/material.dart';
import 'package:my_task/screens/recipe_list_screen.dart';

import '../widgets/add_recipe_widget.dart';

class AddRecipeScreen extends StatelessWidget {
  //const RecipeScreen({Key? key}) : super(key: key);

  static const routeName = '/add-recipe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a Recipe')),
      body: AddRecipeWidget(),
    );
  }
}

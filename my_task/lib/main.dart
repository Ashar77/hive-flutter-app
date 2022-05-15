import 'package:flutter/material.dart';
import 'package:my_task/models/recipe.dart';
import 'package:my_task/screens/add_recipe_screen.dart';
import 'package:my_task/screens/home_screen.dart';
import 'package:my_task/screens/recipe_list_screen.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

const String recipeBoxName = 'recipe_box';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(RecipeAdapter());
  await Hive.openBox<Recipe>(recipeBoxName);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        AddRecipeScreen.routeName: (ctx) => AddRecipeScreen(),
        RecipeList.routeName: (ctx) => RecipeList(),
      },
    );
  }
}

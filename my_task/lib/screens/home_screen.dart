import 'package:flutter/material.dart';
import 'package:my_task/screens/add_recipe_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
        ),
        body: Center(
          child: Container(
            child: Text(
              'Home Screen',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            Navigator.of(context).pushNamed(AddRecipeScreen.routeName);
          }),
          child: const Icon(Icons.add),
        ));
  }
}

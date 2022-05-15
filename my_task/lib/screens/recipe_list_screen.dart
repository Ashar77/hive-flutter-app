import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_task/main.dart';
import 'package:my_task/models/recipe.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({Key? key, @required this.lisRecipe}) : super(key: key);
  static const routeName = '/recipe-list';

  // RecipeList({this.lisRecipe});

  final Box<Recipe>? lisRecipe;

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  //RecipeList({this.})
  @override
  Widget build(BuildContext context) {
    //Box<Recipe>? lisRecipeBox; // refrence to the box
    // have to import that box!!

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(title: Text('List of Recipes')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            //single child sv
            children: [
              ValueListenableBuilder(
                  valueListenable: widget.lisRecipe!.listenable(),
                  builder: (context, Box<Recipe> recipes, _) {
                    List<int> keys = recipes.keys.cast<int>().toList();

                    return ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: keys.length,
                      shrinkWrap: true,
                      separatorBuilder: (_, index) => Divider(),
                      itemBuilder: (_, index) {
                        final int key = keys[index];

                        final Recipe? recipe =
                            recipes.get(key); //recipe = single recipe item

                        return Container(
                          margin: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(recipe!.title!),
                                subtitle: Text(recipe.description!),
                                leading: CircleAvatar(
                                  radius: 28,
                                  backgroundImage:
                                      NetworkImage(recipe.imageUrl!),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    recipes.delete(key);
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

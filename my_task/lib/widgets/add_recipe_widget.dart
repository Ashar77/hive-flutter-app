import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_task/models/recipe.dart';
import 'package:my_task/widgets/image_row_widget.dart';

import '../main.dart';
import '../screens/recipe_list_screen.dart';

class AddRecipeWidget extends StatefulWidget {
  //const AddRecipeWidget({Key? key}) : super(key: key);

  @override
  _AddRecipeWidgetState createState() => _AddRecipeWidgetState();
}

class _AddRecipeWidgetState extends State<AddRecipeWidget> {
  late Box<Recipe> recipeBox; // refrence to the box

  static TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<String> imageList = [
    'https://natashaskitchen.com/wp-content/uploads/2020/05/Vanilla-Cupcakes-3.jpg',
    'https://natashaskitchen.com/wp-content/uploads/2021/04/Chocolate-Cupcakes-SQ.jpg',
    'https://i2.wp.com/sisterskneadsweets.com/wp-content/uploads/2020/05/choco-coffee-cupcake-pic-2-scaled.jpg?fit=683%2C1024&ssl=1'
  ];

  List<Widget> list = [];

  String? selectedImage;

  bool _validate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recipeBox = Hive.box(recipeBoxName); //initializing the box
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   titleController.dispose();
  //   descriptionController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < imageList.length; i++) {
      list.add(
        GestureDetector(
          child: CircleAvatar(
            backgroundImage: NetworkImage(imageList[i]),
          ),
          onTap: () {
            print(imageList[i]);
            selectedImage = imageList[i];
          },
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: titleController,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 24),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8)),
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              'Description',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              child: TextField(
                controller: descriptionController,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 17,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(vertical: 150.0),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list),

            //ImageRowWidget(selectedImage: ,),          //here
            SizedBox(
              height: 90,
            ),
            Center(
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  final String myTitle = titleController.text;
                  final String myDescription = descriptionController.text;
                  final String myImageUrl = selectedImage ??
                      'https://i.ytimg.com/vi/YP8a6ugKQ6Y/maxresdefault.jpg';
                  Recipe myRecipe = Recipe(
                      title: myTitle,
                      description: myDescription,
                      imageUrl: myImageUrl);

                  recipeBox.add(myRecipe);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipeList(
                                lisRecipe: recipeBox,
                              )));
                },
                child: Text('Save Recipe'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

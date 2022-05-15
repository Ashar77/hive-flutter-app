import 'package:flutter/material.dart';

class ImageRowWidget extends StatefulWidget {
  const ImageRowWidget({Key? key, @required this.selectedImage})
      : super(key: key);

  final String? selectedImage;

  @override
  _ImageRowWidgetState createState() => _ImageRowWidgetState();
}

class _ImageRowWidgetState extends State<ImageRowWidget> {
  List<String> imageList = [
    'https://natashaskitchen.com/wp-content/uploads/2020/05/Vanilla-Cupcakes-3.jpg',
    'https://natashaskitchen.com/wp-content/uploads/2021/04/Chocolate-Cupcakes-SQ.jpg',
    'https://i2.wp.com/sisterskneadsweets.com/wp-content/uploads/2020/05/choco-coffee-cupcake-pic-2-scaled.jpg?fit=683%2C1024&ssl=1'
  ];

  List<Widget> list = [];

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
            //widget.selectedImage = imageList[i];
          },
        ),
      );
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: list);
  }
}

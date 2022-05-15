import 'package:hive/hive.dart';

import 'package:hive/hive.dart';

part 'recipe.g.dart';

@HiveType(typeId: 0)
class Recipe {
  @HiveField(0)
  final String? title;

  @HiveField(1)
  final String? description;

  @HiveField(2)
  final String? imageUrl;

  Recipe({this.title, this.description, this.imageUrl});
}

import 'package:shared_preferences/shared_preferences.dart';

class CategoryModel {
  String name;
  int level;
  String imagePath;
  bool isAccessible;

  CategoryModel({
    required this.name,
    required this.level,
    required this.imagePath,
    required this.isAccessible,
  });

  static getScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? score = prefs.getInt('score');
    return score;
  }
  static Future<List<CategoryModel>> getCategories_level1() async {
    int? score = await getScore();
    List<CategoryModel> level1 = [];
    level1.add(CategoryModel(
        name: 'Alphabets',
        level: 1,
        imagePath: 'assets/level-1-2.png',
        isAccessible: true));
    level1.add(CategoryModel(
        name: 'numbers',
        level: 1,
        imagePath: 'assets/level-1-1.png',
        isAccessible: (score! >= 10)?true:false));
    level1.add(CategoryModel(
        name: 'Salutations',
        level: 1,
        imagePath: 'assets/level-1-3.png',
        isAccessible: (score! >= 20)?true:false));

    level1.add(CategoryModel(
        name: 'family',
        level: 1,
        imagePath: 'assets/level-1-4.png',
        isAccessible: (score! >= 40)?true:false));

    return level1;
  }

  static Future<List<CategoryModel>> getCategories_level2() async {
    int? score = await getScore();
    List<CategoryModel> level2 = [];
    level2.add(CategoryModel(
        name: 'emotions',
        level: 2,
        imagePath: 'assets/level-2-1.png',
        isAccessible: (score! >= 140)?true:false));
    level2.add(CategoryModel(
        name: 'animals',
        level: 2,
        imagePath: 'assets/level-2-2.png',
        isAccessible: (score! >= 180)?true:false));

    return level2;
  }

  static Future<List<CategoryModel>> getCategories_level3() async {
    int? score = await getScore();
    List<CategoryModel> level3 = [];
    level3.add(CategoryModel(
        name: 'transport',
        level: 3,
        imagePath: 'assets/level-3-1.png',
        isAccessible: (score! >= 240)?true:false));

    level3.add(CategoryModel(
        name: 'Alphabets',
        level: 3,
        imagePath: 'assets/level-3-2.png',
        isAccessible: (score! >= 290)?true:false));


    return level3;
  }

}

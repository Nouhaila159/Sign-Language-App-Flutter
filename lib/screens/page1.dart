import 'package:app_sign/models/category_model.dart';
import 'package:app_sign/screens/level1/alphabets_level1/alphabets.dart';
import 'package:app_sign/screens/level1/family_level1/family1.dart';
import 'package:app_sign/screens/level1/greetings_level1/greetings1.dart';
import 'package:app_sign/screens/level1/numbers_level1/numbers.dart';
import 'package:app_sign/screens/level2/animals_level2/lion.dart';
import 'package:app_sign/screens/level2/emotions_level2/happy.dart';
import 'package:app_sign/screens/level3/food_level3/banana.dart';
import 'package:app_sign/screens/level3/transport_level3/plane.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatefulWidget {
  Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<CategoryModel> categories1 = [];
  List<CategoryModel> categories2 = [];
  List<CategoryModel> categories3 = [];

  String? pseudo;
  int? score;

  @override
  void initState() {
    super.initState();
    _GetPseudo_Score();
  }

  void _GetPseudo_Score() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      pseudo = prefs.getString('pseudo');
      score = prefs.getInt('score');
    });
  }


  void _getCategories() async{
    categories1 = await CategoryModel.getCategories_level1();
    categories2 = await CategoryModel.getCategories_level2();
    categories3 = await CategoryModel.getCategories_level3();

  }

  void navigationLevel1(int index){
    switch(index){
      case 0 :
        print('Alphabets');
        if(categories1[index].isAccessible)
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Alphabets(),
              ),
            );
          }
        break;
      case 1 :
        print('numbers');
        if(categories1[index].isAccessible) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Numbers(),
            ),
          );
        }
        break;
      case 2 :
        if(categories1[index].isAccessible) {
          print('salutations');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Greetings1(),
            ),
          );
        }
        break;
      case 3 :
        print('family');
        if(categories1[index].isAccessible)
        {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Mom(),
          ),
        );
        }
        break;
    }
  }
  void navigationLevel2(int index){
    switch(index){
      case 0 :
        print('emotions');
        if(categories2[index].isAccessible) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Happy(),
            ),
          );}
          break;

      case 1 :
        print('animals');
        if(categories2[index].isAccessible) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Lion(),
            ),
          );
        }
        break;
    }
  }
  void navigationLevel3(int index){
    switch(index){
      case 0 :
        print('transport');
        if(categories3[index].isAccessible) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Plane(),
            ),
          );
        }
        break;
      case 1 :
        print('food');
        if(categories3[index].isAccessible) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Banana(),
            ),
          );
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _GetPseudo_Score();
    _getCategories();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 60, 0, 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello ${pseudo}!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Image(
                            image: AssetImage("assets/diamond.png")
              
                            ),
                          ),
                      Text(
                        "${score}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.46000000834465027),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                'Your Lessons',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Level 1",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Color(0xFF9ECB3A)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              child: ListView.separated(
                itemCount: categories1.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20, right: 20),
                separatorBuilder: (context, index) => SizedBox(
                  width: 25,
                ),
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () async{
                      navigationLevel1(index);
                    },
                    child: Container(
                      width: 93,
                      height: 116,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage(categories1[index].imagePath),
                          fit: BoxFit.cover,
                          colorFilter: categories1[index].isAccessible
                              ? null
                              : ColorFilter.mode(Colors.grey, BlendMode.modulate),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Level 2",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Color(0xFF9ECB3A)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              child: ListView.separated(
                itemCount: categories2.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20, right: 20),
                separatorBuilder: (context, index) => SizedBox(
                  width: 25,
                ),
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      navigationLevel2(index);
                    },
                    child: Container(
                      width: 93,
                      height: 116,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage(categories2[index].imagePath),
                          fit: BoxFit.cover,
                          colorFilter: categories2[index].isAccessible
                              ? null
                              : ColorFilter.mode(Colors.grey, BlendMode.modulate),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Level 3",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Color(0xFF9ECB3A)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              child: ListView.separated(
                itemCount: categories3.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20, right: 20),
                separatorBuilder: (context, index) => SizedBox(
                  width: 25,
                ),
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      navigationLevel3(index);
                    },
                    child: Container(
                      width: 93,
                      height: 116,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage(categories3[index].imagePath),
                          fit: BoxFit.cover,
                          colorFilter: categories3[index].isAccessible
                              ? null
                              : ColorFilter.mode(Colors.grey, BlendMode.modulate),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

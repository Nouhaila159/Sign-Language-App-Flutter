import 'package:app_sign/screens/home.dart';
import 'package:app_sign/screens/level1/congratulation1.dart';
import 'package:app_sign/screens/level1/quizs_level1/quiz2_l1.dart';
import 'package:app_sign/screens/pseudo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnswerQuestion3 extends StatefulWidget {
  const AnswerQuestion3({Key? key}) : super(key: key);

  @override
  State<AnswerQuestion3> createState() => _AnswerQuestion3State();
}

class _AnswerQuestion3State extends State<AnswerQuestion3> {
  int? score;

  @override
  void initState() {
    super.initState();
  }

  void _getScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    score = prefs.getInt('score');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _getScore();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Alignez les éléments à gauche et à droite
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Image(
                      image: AssetImage("assets/image3.png"),
                      width: 100,
                      height: 50,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Text(
                          '${score}',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.46),
                            fontSize: 24,
                            fontFamily: 'Inder',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Image(
                        image: AssetImage("assets/diament.png"),
                        height: 40,
                      ),
                    ],
                  ),
                ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            width: 300,
            height: 200,
            decoration: ShapeDecoration(
              color: Color(0xFFD4D4BE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Container(
              width: 261,
              height: 185,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/level1/greetings_level1/hello_card.png"),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              width: 180,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage("assets/level1/greetings_level1/hello.png"),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                int score = await prefs.getInt('score') ?? 0;
                if (score >= 120 && score < 140) {
                  await prefs.setInt('score', score! + 20);
                  setState(() {});
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Congratulation1()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.only(top: 65),
                width: 328,
                height: 93,
                decoration: ShapeDecoration(
                  color: Color(0xC49ECB3A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Success',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Inika',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        height: 56,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage("assets/diament.png"),
                              height: 40,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '+20',
                              style: TextStyle(
                                color: Colors.black
                                    .withOpacity(0.6200000047683716),
                                fontSize: 30,
                                fontFamily: 'Inika',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

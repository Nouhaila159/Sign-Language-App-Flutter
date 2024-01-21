import 'package:app_sign/screens/level2/quizs_level2/answerQuestion1.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Quiz1_l2 extends StatefulWidget {
  const Quiz1_l2({Key? key}) : super(key: key);

  @override
  State<Quiz1_l2> createState() => _Quiz1_l2State();
}

class _Quiz1_l2State extends State<Quiz1_l2> {
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

  void alert(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Error",
      desc: "Wrong answer",
      buttons: [
        DialogButton(
          child: Text(
            "Try again",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 100,
        )
      ],
    ).show();
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
                          "${score}",
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
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 10, top: 20),
                  width: 169.20,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: Color(0xFFB2B23F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Quiz Level 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 328,
            height: 250,
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
                  image:
                      AssetImage("assets/level2/animals_level2/lion_card.png"),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: 45, right: 45, bottom: 20, top: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          alert(context);
                        },
                        child: Container(
                          width: 129,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/level2/animals_level2/zebra.png"),
                              fit: BoxFit.fill,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ],
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          alert(context);
                        },
                        child: Container(
                          width: 129,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/level2/animals_level2/tiger.png"),
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
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(left: 45, right: 45, bottom: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to the destination screen when the image is clicked
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnswerQuestion1()),
                          );
                        },
                        child: Container(
                          width: 129,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/level2/animals_level2/lion.png"),
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
                      InkWell(
                        onTap: () {
                          alert(context);
                        },
                        child: Container(
                          width: 129,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/level2/animals_level2/giraffe.png"),
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
                    ]),
              )
            ],
          ),
        ],
      ),
    ));
  }
}

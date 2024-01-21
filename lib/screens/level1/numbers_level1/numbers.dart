import 'package:app_sign/screens/home.dart';
import 'package:app_sign/screens/page1.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Numbers extends StatefulWidget {
  const Numbers({Key? key}) : super(key: key);

  @override
  State<Numbers> createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
  void alert(int nbr) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Good Job",
      desc: "You have got +${nbr}",
      buttons: [
        DialogButton(
          child: Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(

            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 20),
                      width: 97,
                      height: 44,
                      child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Add other widgets here
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16, top: 21),
                      width: 181.82,
                      height: 47,
                      decoration: ShapeDecoration(
                        color: Color(0xFFB2B23F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Center(
                        // Center the text vertically within the container
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Level 1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Add other widgets here
                  ],
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 250,
                    height: 300,
                    decoration: ShapeDecoration(
                      color: Color(0x7AA5A577),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Image.asset(
                      'assets/level1/numbers_level1/numbers_card.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 200,
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/level1/numbers_level1/numbers.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40, left: 10, bottom: 30),
                  child: SizedBox(
                    child: Text(
                      'Numbers',
                      style: TextStyle(
                        color: Color(0xFF7E7E2C),
                        fontSize: 45,
                        fontFamily: 'Inika',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Ajouter cette ligne
                  children: [
                    Container(
                      width: 85,
                      height: 52,
                      margin: EdgeInsets.only(
                          left: 16, bottom: 16), // Ajuster la marge au besoin
                      decoration: ShapeDecoration(
                        color: Color(0xFFB4D767),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(44),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child:  InkWell(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        child:  Icon(
                        Icons
                            .arrow_back_outlined, // Remplacez cela par l'icône que vous souhaitez
                        color: Colors.white,
                        size: 50,
                        // Couleur de l'icône
                      ),
                    ),
                    ),
                    Container(
                      width: 90,
                      height: 52,
                      margin: EdgeInsets.only(
                          right: 20, bottom: 16,left:50), // Ajuster la marge au besoin
                      decoration: ShapeDecoration(
                        color: Color(0xFFB4D767),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(44),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () async {
                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                          int score = await prefs.getInt('score') ?? 0;
                          if(score<20)
                          {
                            await prefs.setInt('score', score! + 10);
                            setState(() {
                            });
                            alert(10);
                          }
                          else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          }

                        },
                        child:Icon(
                          Icons.arrow_forward_rounded, // Remplacez cela par l'icône que vous souhaitez
                          color: Colors.white,
                          size: 50,
                        ) ,
                      ),

                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

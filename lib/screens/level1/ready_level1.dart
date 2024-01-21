import 'package:app_sign/screens/home.dart';
import 'package:app_sign/screens/level1/quizs_level1/quiz1_l1.dart';
import 'package:flutter/material.dart';

class Ready_level1 extends StatefulWidget {
  const Ready_level1({Key? key}) : super(key: key);

  @override
  State<Ready_level1> createState() => _Ready_level1State();
}

class _Ready_level1State extends State<Ready_level1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40), // Ajoutez la marge souhaitée ici
              alignment: Alignment.centerLeft, // Alignez l'image à gauche
              child: Image(
                image: AssetImage("assets/image3.png"),
                width: 100,
                height: 50,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: 250,
                height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("assets/lampe.png"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            SizedBox(
              width: 120,
              child: Text(
                'Ready !',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontFamily: 'Inder',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Quiz1_l1();
                    }),
                  );},
                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF9ECB3A)),
                  overlayColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 64, 86, 17)),
                ),

                child: Text(
                  "Quiz",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Home();
                    }),
                  );},
                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF9ECB3A)),
                  overlayColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 64, 86, 17)),
                ),

                child: Text(
                  "Cancel",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

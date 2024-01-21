import 'package:app_sign/screens/home.dart';
import 'package:app_sign/screens/pseudo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 600,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img_splashScreen.png"),
                    fit: BoxFit.fitWidth),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  final String? pseudo = prefs.getString('pseudo');
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return (pseudo==null)?Pseudo():Home();
                  }),
                );},
                style: ButtonStyle(
                  
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF9ECB3A)), 
                  overlayColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 64, 86, 17)),
                ),
      
                child: Text(
                  "LET'S GO -> ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
                ),
                
      
              ),
            ),
          ],
        ),
      ),
    );
  }
}

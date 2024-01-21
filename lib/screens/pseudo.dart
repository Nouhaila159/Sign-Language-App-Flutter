import 'package:flutter/material.dart';
import 'package:app_sign/screens/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pseudo extends StatefulWidget {
  const Pseudo({Key? key}) : super(key: key);

  @override
  State<Pseudo> createState() => _Pseudo();
}

class _Pseudo extends State<Pseudo> {
  TextEditingController controller = TextEditingController();
  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    descTextAlign: TextAlign.start,
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
    alertAlignment: Alignment.topCenter,
  );
  void alert(BuildContext context) {
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: "ALERT",
      desc: "Please Write a pseudo",
      buttons: [
        DialogButton(
          child: Text(
            "Let's go",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.lightGreen,
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 80, bottom: 20),
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image3.png"),
                      fit: BoxFit.fitWidth),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 50,
                width: 250,
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Pseudo",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                          color:
                              Color(0xFF9ECB3A)), // Set the color of the border
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () async{
                    String pseudo = controller.text;
                    if(pseudo.isEmpty){
                      print("write a pseudo");
                      alert(context);
                    }
                    else{
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setString('pseudo', pseudo);
                      await prefs.setInt('score', 0);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Home();
                        }),
                      );
                    }

                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF9ECB3A)),
                    overlayColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 64, 86, 17)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: FaIcon(FontAwesomeIcons.arrowRight, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

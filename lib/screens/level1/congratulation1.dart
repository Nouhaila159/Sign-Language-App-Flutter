import 'package:app_sign/screens/home.dart';
import 'package:flutter/material.dart';

class Congratulation1 extends StatefulWidget {
  const Congratulation1({Key? key}) : super(key: key);

  @override
  State<Congratulation1> createState() => _Congratulation1State();
}

class _Congratulation1State extends State<Congratulation1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
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
            Container(
              margin: EdgeInsets.only(top: 200),
              width: 328,
              height: 115,
              child: Stack(
                children: [
                  Container(
                    decoration: ShapeDecoration(
                      color: Color(0xFF9ECB3A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1, // Ajustez cette valeur pour positionner l'image
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        'assets/icon-park-solid_success.png', // Remplacez par le chemin de votre image
                        width:
                            50, // Ajustez la largeur de l'image selon vos besoins
                        height:
                            50, // Ajustez la hauteur de l'image selon vos besoins
                      ),
                    ),
                  ),
                  Positioned(
                    bottom:
                        20, // Ajustez cette valeur pour positionner le texte
                    left: 14, // Ajustez cette valeur pour positionner le texte
                    right: 14, // Ajustez cette valeur pour positionner le texte
                    child: Center(
                      child: Text(
                        'Congratulations! You have passed Level 1 successfully.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.36,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Ajouter cette ligne
              children: [
                Container(
                  width: 90,
                  height: 52,
                  margin: EdgeInsets.only(
                      right: 30,
                      bottom: 16,
                      left: 50,
                      top: 150), // Ajuster la marge au besoin
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
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Icon(
                      Icons
                          .arrow_forward_rounded, // Remplacez cela par l'icône que vous souhaitez
                      color: Colors.white,
                      size: 50,
                      // Couleur de l'icône
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

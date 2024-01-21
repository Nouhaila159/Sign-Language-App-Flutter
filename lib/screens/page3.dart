import 'package:app_sign/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  int? score;
  int level = 1;
  int localScore=0;
  int scoreLimit=0;

  @override
  void initState() {
    super.initState();
  }

  void _getScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    score = prefs.getInt('score');

    if (score != null) {
      if (score! >= 0 && score! < 140) {
        level = 1;
        localScore = score!;
        scoreLimit = 140;
      } else if (score! >= 140 && score! < 280) {
        level = 2;
        localScore = score! - 140;
        scoreLimit = 140;
      } else {
        level = 3;
        localScore = score! - 280;
        scoreLimit = 130;
      }
    } else {
      // Handle the case where score is null (set default values or handle appropriately)
      level = 1;
      localScore = 0;
      scoreLimit = 1; // Set a default value to avoid division by zero
    }

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    _getScore();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Image(image: AssetImage("assets/diamond.png")),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text(
                      "${score}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.46),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset("assets/tresor.png"),
                  Container(
                    width: 281,
                    height: 57,
                    color: Color(0xFF9ECB3A),
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        child: Text(
                          'Start a lesson',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
              // Row with level circle and progress bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightGreen,
                    ),
                    child: Center(
                      child: Text(
                        'Lv. $level',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        //value: (localScore ?? 0) / scoreLimit,
                        value: (scoreLimit > 0) ? (localScore / scoreLimit).clamp(0.0, 1.0) : 0.0,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

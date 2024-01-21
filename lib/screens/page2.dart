import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  TextEditingController _searchController = TextEditingController();
  Map<String, String> imagePaths = {
    "dad": "assets/level1/family_level1/dad_card.png",
    "brother": "assets/level1/family_level1/brother_card.png",
    "mom": "assets/level1/family_level1/mom_card.png",
    "sister": "assets/level1/family_level1/sister_card.png",
    "car": "assets/level3/transport_level3/car_card.png",
    "plane": "assets/level3/transport_level3/plane_card.png",
    "bus": "assets/level3/transport_level3/bus_card.png",
  };
  String? displayedImagePath;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_updateDisplayedImage);
  }

  @override
  void dispose() {
    _searchController.removeListener(_updateDisplayedImage);
    _searchController.dispose();
    super.dispose();
  }

  void _updateDisplayedImage() {
    setState(() {
      displayedImagePath = imagePaths[_searchController.text.toLowerCase()];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: 16,
            top: 10,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 26),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: "Search",
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Perform search functionality here if needed
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF9ECB3A)),
                  overlayColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 64, 86, 17)),
                ),
                child: Text(
                  "SEARCH",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              if (displayedImagePath != null)
                Image.asset(
                  displayedImagePath!,
                  height: 200, // Adjust the height as needed
                  width: 200, // Adjust the width as needed
                ),
            ],
          ),
        ),
      ),
    );
  }
}

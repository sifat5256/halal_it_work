import 'package:flutter/material.dart';
import 'back_groundImage.dart';

class HomeScreenWithImageBackgroundDynamicaaly extends StatefulWidget {
  @override
  _HomeScreenWithImageBackgroundDynamicaalyState createState() =>
      _HomeScreenWithImageBackgroundDynamicaalyState();
}

class _HomeScreenWithImageBackgroundDynamicaalyState
    extends State<HomeScreenWithImageBackgroundDynamicaaly> {
  List<String> images = [
    "asset/images/abcdefgh.png",
    "asset/images/abcd.png",
    "asset/images/dbbl.png",
  ]; // List of background images
  String selectedImage = "asset/images/abcdefgh.png"; // Default background image

  void changeBackground(String newImage) {
    setState(() {
      selectedImage = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        backgroundImage: selectedImage, // Dynamic Background
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image selection from Containers
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.map((img) {
                  return GestureDetector(
                    onTap: () => changeBackground(img),
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            SizedBox(height: 30),
            _buildNumberPad(),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberPad() {
    return Column(
      children: [
        for (var row in [
          ['1', '2', '3'],
          ['4', '5', '6'],
          ['7', '8', '9'],
          ['C', '0', 'OK']
        ])
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row.map((num) => _buildNumberButton(num)).toList(),
          ),
      ],
    );
  }

  Widget _buildNumberButton(String number) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        height: 70,
        width: 70,
        child: Center(
          child: Text(
            number,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

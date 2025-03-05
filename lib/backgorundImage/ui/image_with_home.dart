import 'package:flutter/material.dart';
import 'back_groundImage.dart'; // Your background widget

class HomeScreenWithImageBackground extends StatefulWidget {
  @override
  _HomeScreenWithImageBackgroundState createState() =>
      _HomeScreenWithImageBackgroundState();
}

class _HomeScreenWithImageBackgroundState
    extends State<HomeScreenWithImageBackground> {
  List<String> images = [
    "asset/images/abcdefgh.png",
    "asset/images/abcd.png",
    "asset/images/green.png",
  ]; // List of background images

  String selectedImage = "asset/images/abcdefgh.png"; // Default background image
  String userInput = "";

  void changeBackground(String newImage) {
    setState(() {
      selectedImage = newImage;
    });
  }

  void onNumberPressed(String number) {
    setState(() {
      userInput += number; // Append number to user input
    });
  }

  void onClear() {
    setState(() {
      userInput = ""; // Clear user input
    });
  }

  void _showResultDialog() {
    String message;
    String emoji;
    Color bgColor;

    if (userInput == "10") { // Correct answer for 5 + 5
      message = "Great Job! 🎉";
      emoji = "🎯✨";
      bgColor = Colors.green.shade300;
    } else {
      message = "Oops! Try Again 😕";
      emoji = "❌";
      bgColor = Colors.orange.shade300;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Center(
          child: Text(
            message,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emoji,
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 10),
            Text(
              userInput == "10"
                  ? "You're a Math Star! 🌟"
                  : "Keep Trying, You Can Do It!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                onClear(); // Clear input after closing
              },
              child: Text("OK", style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        backgroundImage: selectedImage,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 15),
                _buildNumberBox("5"),
                _buildNumberBox("+"),
                _buildNumberBox("5"),
                SizedBox(width: 15),
              ],
            ),
            SizedBox(height: 20),
            _buildNumberBox("="),
            SizedBox(height: 20),
            Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red.shade200,
              shadowColor: Colors.black,
              elevation: 4,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 80,
                width: 180,
                child: Center(
                  child: Text(
                    userInput.isEmpty ? "?" : userInput,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            _buildNumberPad(),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberBox(String text) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      shadowColor: Colors.black,
      elevation: 4,
      color: Colors.red.shade200,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red.shade200,
        ),
        height: 80,
        width: 80,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberPad() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
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
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return GestureDetector(
      onTap: () {
        if (number == "C") {
          onClear();
        } else if (number == "OK") {
          _showResultDialog();
        } else {
          onNumberPressed(number);
        }
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.redAccent.shade200,
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

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'button/sos.dart';

class HomeScreen1 extends StatefulWidget {
  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  bool isLocationSharing = false;
  double sosButtonSize = 60;
  List<Widget> successIcons = [];

  void _triggerSOS() {
    setState(() {
      sosButtonSize = 90;
      _startSuccessIconRain();
    });

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        sosButtonSize = 60;
      });
    });
  }

  void _startSuccessIconRain() {
    for (int i = 0; i < 10; i++) {
      double startX = Random().nextDouble() * MediaQuery.of(context).size.width;
      double duration = Random().nextDouble() * 2 + 1;

      successIcons.add(Positioned(
        top: -50,
        left: startX,
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: -50, end: MediaQuery.of(context).size.height),
          duration: Duration(seconds: duration.toInt()),
          curve: Curves.easeInOut,
          builder: (context, double value, child) {
            return Opacity(
              opacity: 1 - (value / MediaQuery.of(context).size.height),
              child: Transform.translate(
                offset: Offset(0, value),
                child: Icon(FontAwesomeIcons.checkCircle, color: Colors.green, size: 30),
              ),
            );
          },
        ),
      ));
    }

    setState(() {});

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        successIcons.clear();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: FadeInDown(
          child: Text(
            "Safety App",
            style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 5,
      ),
      body: Column(
        children: [
          SOSButtonScreen(),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    GestureDetector(
                      onLongPress: _triggerSOS,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                      TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      duration: Duration(seconds: 1),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value.clamp(0.0, 1.0), // Ensures value is within valid range
                          child: child,
                        );
                      },
                    ),
            AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            width: sosButtonSize,
                            height: sosButtonSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.redAccent.withOpacity(0.6),
                                  blurRadius: 20,
                                  spreadRadius: 4,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "SOS",
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    SwitchListTile(
                      title: Text("Live Location Sharing", style: GoogleFonts.poppins(fontSize: 16)),
                      subtitle: Text("Share your location with emergency contacts"),
                      value: isLocationSharing,
                      onChanged: (val) {
                        setState(() {
                          isLocationSharing = val;
                        });
                      },
                      activeColor: Colors.redAccent,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _quickAction(FontAwesomeIcons.exclamationTriangle, "Report Incident"),
                        _quickAction(FontAwesomeIcons.phone, "Emergency Contacts"),
                        _quickAction(FontAwesomeIcons.infoCircle, "Safety Tips"),
                      ],
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Recent Alerts", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return FadeInLeft(
                            delay: Duration(milliseconds: index * 200),
                            child: ListTile(
                              leading: Icon(Icons.warning, color: Colors.redAccent),
                              title: Text("Incident Reported: Suspicious Activity", style: GoogleFonts.poppins()),
                              subtitle: Text("2 mins ago, Near Central Park"),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ...successIcons,
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: "Reports"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  Widget _quickAction(IconData icon, String label) {
    return BounceIn(
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.redAccent.withOpacity(0.2),
            child: Icon(icon, color: Colors.redAccent, size: 30),
          ),
          SizedBox(height: 8),
          Text(label, style: GoogleFonts.poppins(fontSize: 14), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

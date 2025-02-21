import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  String selectedTab = "Line";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.yellowAccent,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
     // padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _tabItem("Line", isSelected: selectedTab == "Line"),
          _tabItem("15m", isSelected: selectedTab == "15m"),
          _tabItem("1h", isSelected: selectedTab == "1h"),
          _tabItem("4h", isSelected: selectedTab == "4h"),
          _tabItem("1D", isSelected: selectedTab == "1D"),
          _dropdownTab(), // More dropdown
          _tabItem("Depth", isSelected: selectedTab == "Depth"),
        ],
      ),
    );
  }

  Widget _tabItem(String text, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = text;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: isSelected
            ? BoxDecoration(
          color: Colors.yellowAccent,
          borderRadius: BorderRadius.circular(4),
        )
            : null,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _dropdownTab() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: "More",
        icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
        onChanged: (String? newValue) {
          setState(() {
            selectedTab = newValue!;
          });
        },
        items: ["More", "Option1", "Option2", "Option3"]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                )),
          );
        }).toList(),
      ),
    );
  }
}

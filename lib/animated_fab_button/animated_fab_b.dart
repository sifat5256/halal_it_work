import 'package:flutter/material.dart';

class ExpandableFabExample extends StatefulWidget {
  @override
  _ExpandableFabExampleState createState() => _ExpandableFabExampleState();
}

class _ExpandableFabExampleState extends State<ExpandableFabExample> with TickerProviderStateMixin {
  bool isExpanded = false; // Track FAB expansion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expandable FAB Example")),
      body: Center(child: Text("Tap the FAB to expand/collapse")),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // Animated Expandable Buttons
          AnimatedSize(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: isExpanded
                ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMiniFab(Icons.message, "Message", Colors.green, () {
                  print("Message Clicked");
                }),
                _buildMiniFab(Icons.call, "Call", Colors.orange, () {
                  print("Call Clicked");
                }),
                _buildMiniFab(Icons.email, "Email", Colors.red, () {
                  print("Email Clicked");
                }),
                SizedBox(height: 10), // Space before main FAB
              ],
            )
                : SizedBox(), // Hide buttons when collapsed
          ),

          // Large FAB with Multiple Icons
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded; // Toggle expansion
              });
            },
            child: Container(
              width: 80,  // Increased width
              height: 80, // Increased height
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: isExpanded
                    ? Icon(Icons.close, size: 40, color: Colors.white) // Close icon when expanded
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.message, size: 24, color: Colors.white),
                    SizedBox(width: 4),
                    Icon(Icons.call, size: 24, color: Colors.white),
                    SizedBox(width: 4),
                    Icon(Icons.email, size: 24, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to create small FAB buttons
  Widget _buildMiniFab(IconData icon, String tooltip, Color color, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: FloatingActionButton(
        mini: true, // Smaller FAB
        heroTag: tooltip, // Unique hero tag to avoid animation conflicts
        backgroundColor: color,
        tooltip: tooltip,
        child: Icon(icon, color: Colors.white),
        onPressed: onTap,
      ),
    );
  }
}

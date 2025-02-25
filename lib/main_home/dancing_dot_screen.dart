import 'package:flutter/material.dart';

// Main Screen with Dancing Three-Dots Icon in AppBar and Static Content
class DancingDotsScreen extends StatefulWidget {
  @override
  _DancingDotsScreenState createState() => _DancingDotsScreenState();
}

class _DancingDotsScreenState extends State<DancingDotsScreen> with TickerProviderStateMixin {
  late AnimationController _dotsController;
  late Animation<double> _dotsAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller for dancing dots
    _dotsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Define the dancing animation (up and down movement)
    _dotsAnimation = Tween<double>(begin: 0.0, end: 0.1).animate(
      CurvedAnimation(parent: _dotsController, curve: Curves.easeInOut),
    );

    // Start the animation with repeat method
    _dotsController.repeat(reverse: true); // Repeats the animation up and down
  }

  @override
  void dispose() {
    _dotsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dancing Dots AppBar"),
        actions: [
          // Animated Three Dots Icon (Dancing)
          AnimatedBuilder(
            animation: _dotsController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _dotsAnimation.value * 10), // Move the dots up and down
                child: IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Some body content under the AppBar
            Text("Welcome to the Dancing Dots AppBar!"),
            SizedBox(height: 20),
            Text("This content is below the AppBar."),
            SizedBox(height: 20),
            Text("The three dots in the AppBar are dancing!"),
            SizedBox(height: 20),
            Container(
              height: 200,
              color: Colors.blueAccent,
              child: Center(
                child: Text(
                  "More Content Here",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8), // Optional for rounded corners
      ),
      padding: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start, // Align children to the top
          children: [
            // Left Column (Price and Percentage)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [
                Text(
                  "6786.5",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4), // Add spacing between the texts
                Row(
                  children: [
                    Text(
                      "≈ 1 gm",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "+0.90%",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Spacer(), // Add space between the two columns

            // Right Column (24h Data)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First Column (24h High and 24h Low)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "24h High",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        Text(
                          "000.00",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8), // Add spacing between items
                        Text(
                          "24h Low",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        Text(
                          "000.00",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: 16), // Add horizontal spacing between columns
                    // Second Column (24h Vol(GOLD) and 24h Vol(BDT))
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "24h Vol(GOLD)",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        Text(
                          "0.0000",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8), // Add spacing between items
                        Text(
                          "24h Vol(BDT)",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        Text(
                          "0.0000",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

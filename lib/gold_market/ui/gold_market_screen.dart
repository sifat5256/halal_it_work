import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GoldMarketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        title: Text("GOLD/BDT",style: TextStyle(
          color: Colors.black
        ),),
        actions: [
          Icon(Icons.circle,size: 30,color: Colors.grey.shade500,),
          Icon(Icons.circle,size: 30,color: Colors.grey.shade500,),
          Icon(Icons.circle,size: 30,color: Colors.grey.shade500,),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPriceCard(),
            SizedBox(height: 10),
            _buildTabBar(),
            SizedBox(height: 10),
            _buildGraph(),
            Spacer(),
            _buildBuySellButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child:  Row(
         // Align children to the top
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
                Text(
                  "1 gm  +0.90%",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            Spacer(), // Add space between the two columns

            // Right Column (24h Data)
            Column(
             // crossAxisAlignment: CrossAxisAlignment.start, // Align text to the right
              children: [
                Row(
                  children: [
                    // First Column (24h High and 24h Low)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "24h High\n000.00",
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(height: 8), // Add spacing between items
                        Text(
                          "24h Low\n000.00",
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                    SizedBox(width: 16), // Add horizontal spacing between columns
                    // Second Column (24h Vol(GOLD) and 24h Vol(BDT))
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "24h Vol(GOLD)\n0.0000",
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(height: 8), // Add spacing between items
                        Text(
                          "24h Vol(BDT)\n0.0000",
                          textAlign: TextAlign.end,
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

  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _tabItem("Line", isSelected: true),
        _tabItem("15m"),
        _tabItem("1h"),
        _tabItem("1D"),
        _tabItem("More"),
      ],
    );
  }

  Widget _tabItem(String text, {bool isSelected = false}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: isSelected ? Colors.black : Colors.grey,
      ),
    );
  }

  Widget _buildGraph() {
    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toStringAsFixed(1),
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  );
                },
                reservedSize: 30,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  Map<int, String> labels = {
                    0: "Today",
                    1: "7 Days",
                    2: "30 Days",
                    3: "90 Days",
                    4: "180 Days",
                  };
                  return labels.containsKey(value.toInt())
                      ? Text(
                    labels[value.toInt()]!,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  )
                      : Container();
                },
                reservedSize: 20,
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 0.1),
                FlSpot(1, 0.15),
                FlSpot(2, 0.2),
                FlSpot(3, 0.5),
                FlSpot(4, 1.9),
              ],
              isCurved: true,
              color: Colors.yellow.shade700,
              barWidth: 1,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.yellow.shade700.withOpacity(0.5),
                    Colors.yellow.shade700.withOpacity(0.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              dotData: FlDotData(show: false),
            ),
            // Underline section
            LineChartBarData(
              spots: [
                FlSpot(0, 0.2),
                FlSpot(1, 0.25),
                FlSpot(2, 0.32),
                FlSpot(3, 0.65),
                FlSpot(4, 2.0),
              ],
              isCurved: false,
              color: Colors.yellow.shade700,
              barWidth: 1,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false), // No extra fill here
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildBuySellButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton("BUY", Colors.green),
        _buildButton("SELL", Colors.red),
      ],
    );
  }

  Widget _buildButton(String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Fixed issue here
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      ),
      onPressed: () {},
      child: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}

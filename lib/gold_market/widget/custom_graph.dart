import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildGraph(),
        SizedBox(height: 10),
        _buildBottomLabels(),
      ],
    );
  }

  Widget _buildGraph() {
    return SizedBox(
      height: 250,
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
                reservedSize: 40,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false, // Hidden, as we add labels separately
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            // Main Line Chart
            LineChartBarData(
              spots: [
                FlSpot(0, 6750.1),
                FlSpot(1, 6760.2),
                FlSpot(2, 6765.3),
                FlSpot(3, 6770.5),
                FlSpot(4, 6786.5),
              ],
              isCurved: true,
              color: Colors.yellow.shade700,
              barWidth: 2,
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
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 1,
                    color: Colors.yellow.shade700,
                    strokeColor: Colors.black,
                    strokeWidth: 1,
                  );
                },
              ),
            ),
            LineChartBarData(
              spots: [
                FlSpot(0, 6752.1),
                FlSpot(1, 6762.2),
                FlSpot(2, 6767.3),
                FlSpot(3, 6772.5),
                FlSpot(4, 6788.5),
              ],
              isCurved: true,
              color: Colors.yellow.shade700,
              barWidth: 2,
              isStrokeCapRound: true,

              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 1,
                    color: Colors.yellow.shade700,
                    strokeColor: Colors.black,
                    strokeWidth: 1,
                  );
                },
              ),
            ),
          ],

        ),
      ),
    );
  }

  Widget _buildBottomLabels() {
    List<String> labels = ["Today", "7 Days", "30 Days", "90 Days", "180 Days"];
    List<String> values = ["+0.05%", "+0.15%", "+0.20%", "+2.20%", "+22.20%"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(labels.length, (index) {
        return Column(
          children: [
            Text(
              labels[index],
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 4),
            Text(
              values[index],
              style: TextStyle(
                fontSize: 12,
                color: Colors.orange.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      }),
    );
  }
}

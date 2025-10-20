import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrowthChart extends StatelessWidget {
  const GrowthChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 28)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            // Asosiy chiziq
            LineChartBarData(
              spots: const [
                FlSpot(1, 0),
                FlSpot(2, 2.5),
                FlSpot(3, 3.8),
                FlSpot(4, 4.5),
                FlSpot(5, 5.0),
                FlSpot(6, 5.4),
                FlSpot(7, 5.7),
                FlSpot(8, 6.0),
                FlSpot(9, 6.3),
                FlSpot(10, 6.5),
              ],
              isCurved: true,
              color: Colors.pink.shade400,
              barWidth: 2.5,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, _, __, ___) => FlDotCirclePainter(color: Colors.pink.shade400, radius: 4),
              ),
              belowBarData: BarAreaData(show: true, color: Colors.pink.shade100.withOpacity(0.5)),
            ),
          ],
          minX: 1,
          maxX: 10,
          minY: 0,
          maxY: 7,
        ),
      ),
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrowthChart extends StatelessWidget {
  const GrowthChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: const EdgeInsets.only(right: 16, top: 16, bottom: 8),
      decoration: BoxDecoration(color: Colors.pink.shade50.withOpacity(0.3), borderRadius: BorderRadius.circular(16)),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 1,
            getDrawingHorizontalLine: (value) {
              return FlLine(color: Colors.grey.shade300, strokeWidth: 1);
            },
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontWeight: FontWeight.w500),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      value.toInt().toString(),
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  );
                },
              ),
            ),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
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
              curveSmoothness: 0.35,
              color: Colors.pink.shade400,
              barWidth: 3,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 5,
                    color: Colors.pink.shade400,
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.pink.shade200.withValues(alpha: 0.5),
                    Colors.pink.shade100.withValues(alpha: 0.3),
                    Colors.pink.shade50.withValues(alpha: 0.1),
                    Colors.pink.shade50.withValues(alpha: 0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
          minX: 1,
          maxX: 10,
          minY: 0,
          maxY: 7,
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.pink.shade400,
              tooltipRoundedRadius: 8,
              getTooltipItems: (List<LineBarSpot> touchedSpots) {
                return touchedSpots.map((LineBarSpot touchedSpot) {
                  return LineTooltipItem(
                    '${touchedSpot.y.toStringAsFixed(1)} kg',
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class GrowthChartWithStandards extends StatelessWidget {
  const GrowthChartWithStandards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: const EdgeInsets.only(right: 16, top: 16, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.pink.shade50.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 1,
            getDrawingHorizontalLine: (value) {
              return FlLine(color: Colors.grey.shade300, strokeWidth: 1);
            },
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontWeight: FontWeight.w500),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      value.toInt().toString(),
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  );
                },
              ),
            ),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            // Upper standard line (WHO +2SD)
            _buildStandardLine(
              spots: const [
                FlSpot(1, 0.5),
                FlSpot(2, 3.2),
                FlSpot(3, 4.5),
                FlSpot(4, 5.2),
                FlSpot(5, 5.7),
                FlSpot(6, 6.1),
                FlSpot(7, 6.4),
                FlSpot(8, 6.7),
                FlSpot(9, 6.9),
                FlSpot(10, 7.0),
              ],
              color: Colors.pink.shade200.withValues(alpha: 0.3),
            ),

            // Lower standard line (WHO -2SD)
            _buildStandardLine(
              spots: const [
                FlSpot(1, -0.5),
                FlSpot(2, 1.8),
                FlSpot(3, 3.0),
                FlSpot(4, 3.8),
                FlSpot(5, 4.3),
                FlSpot(6, 4.7),
                FlSpot(7, 5.0),
                FlSpot(8, 5.3),
                FlSpot(9, 5.6),
                FlSpot(10, 5.8),
              ],
              color: Colors.pink.shade200.withValues(alpha: 0.3),
            ),

            // Main child growth line
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
              curveSmoothness: 0.35,
              color: Colors.pink.shade400,
              barWidth: 3,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 5,
                    color: Colors.pink.shade400,
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.pink.shade200.withValues(alpha: 0.5),
                    Colors.pink.shade100.withValues(alpha: 0.3),
                    Colors.pink.shade50.withValues(alpha: 0.1),
                    Colors.pink.shade50.withValues(alpha: 0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
          minX: 1,
          maxX: 10,
          minY: 0,
          maxY: 7,
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.pink.shade400,
              tooltipRoundedRadius: 8,
              getTooltipItems: (List<LineBarSpot> touchedSpots) {
                return touchedSpots.map((LineBarSpot touchedSpot) {
                  return LineTooltipItem(
                    '${touchedSpot.y.toStringAsFixed(1)} kg',
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ),
    );
  }

  LineChartBarData _buildStandardLine({required List<FlSpot> spots, required Color color}) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      curveSmoothness: 0.35,
      color: color,
      barWidth: 1.5,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
    );
  }
}

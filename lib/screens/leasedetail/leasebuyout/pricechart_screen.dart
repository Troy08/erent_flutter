import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PriceChart extends StatefulWidget {
  const PriceChart({super.key});

  @override
  State<PriceChart> createState() => _PriceChartState();
}

class _PriceChartState extends State<PriceChart> {
  final List<String> labels = ["Jan", "Feb", "Mar", "Apr", "May"];
  final List<double> data = [60, 72.01, 66, 70, 68];
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    double avgPrice = data.reduce((a, b) => a + b) / data.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title & Tabs
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Price History",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Container(
              width: 108,
              decoration: BoxDecoration(
                color: const Color(0xFF2C003F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: const Text(
                        "Card",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xFFA755FF), Color(0xFFFF5975)]),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Lease",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),

        const SizedBox(height: 10),

        // Average price
        Row(
          children: [
            const Text(
              "All Time Avg. Price: ",
              style: TextStyle(fontSize: 12, color: Color(0xFF8C8C8C)),
            ),
            const SizedBox(width: 4),
            Image.asset(
              "assets/icons/dollar-icon.png",
              width: 15,
              height: 15,
            ),
            const SizedBox(width: 2),
            Text(
              avgPrice.toStringAsFixed(2),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // Chart
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF0D0B1E),
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  touchCallback: (FlTouchEvent event, LineTouchResponse? resp) {
                    if (!event.isInterestedForInteractions ||
                        resp == null ||
                        resp.lineBarSpots == null) {
                      setState(() => touchedIndex = null);
                      return;
                    }
                    setState(
                        () => touchedIndex = resp.lineBarSpots![0].x.toInt());
                  },
                  handleBuiltInTouches: true,
                  touchTooltipData: LineTouchTooltipData(
                    // tooltipBgColor: Colors.black,
                    tooltipBorderRadius: BorderRadius.circular(8),
                    getTooltipItems: (spots) {
                      return spots.map((spot) {
                        return LineTooltipItem(
                          '\$${spot.y.toStringAsFixed(2)}',
                          const TextStyle(color: Colors.white),
                        );
                      }).toList();
                    },
                  ),
                ),
                gridData: FlGridData(show: true, drawVerticalLine: true),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int idx = value.toInt();
                        if (idx >= 0 && idx < labels.length) {
                          return Text(
                            labels[idx],
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                      sideTitles:
                          SideTitles(showTitles: true, reservedSize: 40)),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: (data.length - 1).toDouble(),
                minY: 0,
                maxY: data.reduce((a, b) => a > b ? a : b) + 10,
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(
                        data.length, (i) => FlSpot(i.toDouble(), data[i])),
                    isCurved: true,
                    gradient: const LinearGradient(
                        colors: [Color(0xFF52FF00), Color(0xFF52FF00)]),
                    barWidth: 2,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) =>
                          FlDotCirclePainter(
                        radius: 4,
                        color: const Color(0xFF52FF00),
                        strokeWidth: 0,
                      ),
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0x3352FF00),
                          const Color(0x0552FF00)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:customer/helper/my_constans.dart';
import 'package:customer/helper/screen_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


import '../models/my_reading.dart';

class Chart extends StatefulWidget {
 const  Chart({super.key,  required this.reads});
  final List<ReadingsModel> reads;

  @override
  // ignore: library_private_types_in_public_api
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  int touchedIndex = -1;
 List<double>valueEverMoth=[];

  @override
  Widget build(BuildContext context) {
    valueEverMoth=ReadingsModel.getUsageMonth(readings: widget.reads);
    return Container(
      height: Screensize().sizeScreen(context, 0.5, 0.6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox
              (
                width: 600,
                height: 400,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: ReadingsModel.getMaxUsage(read: valueEverMoth),

                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(

                        getTooltipItem: (group, groupIndex, rod, rodIndex) {

                          return BarTooltipItem(
                            'Value: ${rod.toY.toInt()}',
                          const  TextStyle(color: Colors.white),
                          );
                        },
                      ),
                      touchCallback: (event, response) {
                        setState(() {
                          if (response != null && response.spot != null) {
                            touchedIndex = response.spot!.touchedBarGroupIndex;
                          } else {
                            touchedIndex = -1;
                          }
                        });
                      },
                    ),
                    barGroups: List.generate(valueEverMoth.length, (index) {

                      final isTouched = index == touchedIndex;
                      final color = isTouched
                          ? Colors.orange
                          : kColorPrimer;
                      return BarChartGroupData(x: index, barRods: [
                        BarChartRodData(
                          toY: ReadingsModel.getUsageMonth(readings: widget.reads)[index].toDouble(),
                          color: color,
                          width: 30,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ]);
                    }),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            return Text(
                              value.toInt().toString(),
                              style:const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: kColorPrimer,
                              ),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {

                            switch (value.toInt()) {
                              case 0:
                                return const Text('Jan');
                              case 1:
                                return const Text('Feb');
                              case 2:
                                return const Text('Mar');
                              case 3:
                                return const Text('Apr');
                              case 4:
                                return const Text('May');
                              case 5:
                                return const Text('Jun');
                              case 6:
                                return const Text('Jul');
                              case 7:
                                return const Text('Aug');
                              case 8:
                                return const Text('Sep');
                              case 9:
                                return const Text('Oct');
                              case 10:
                                return const Text('Nov');
                              case 11:
                                return const Text('Dec');
                              default:
                                return const Text('');
                            }

                          },
                          reservedSize: 32,
                        ),
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: kColorPrimer.withOpacity(0.3),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border:const Border(
                        left: BorderSide(color: kColorPrimer, width: 2),
                        bottom: BorderSide(color: kColorPrimer, width: 2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:customer/helper/Constans.dart';
import 'package:customer/helper/screenSize.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/Reading.dart';

class Chart extends StatefulWidget {
  Chart({ required this.reads});
  final List<ReadingsModel> reads;

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  int touchedIndex = -1;
 List<double>valueEverMoth=[];

  @override
  Widget build(BuildContext context) {
    valueEverMoth=ReadingsModel.GetUsageMonth(readings: widget.reads);
    return Container(
      height: Screensize().SizeScreen(context, 0.5, 0.6),
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
              child: Container(
                width: 600,
                height: 400,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: ReadingsModel.GetMaxUsage(read: valueEverMoth),

                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(

                        getTooltipItem: (group, groupIndex, rod, rodIndex) {

                          return BarTooltipItem(
                            'Value: ${rod.toY.toInt()}',
                            TextStyle(color: Colors.white),
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
                          : KColorPrimer;
                      return BarChartGroupData(x: index, barRods: [
                        BarChartRodData(
                          toY: ReadingsModel.GetUsageMonth(readings: widget.reads)[index].toDouble(),
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
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: KColorPrimer,
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
                                return Text('Jan');
                              case 1:
                                return Text('Feb');
                              case 2:
                                return Text('Mar');
                              case 3:
                                return Text('Apr');
                              case 4:
                                return Text('May');
                              case 5:
                                return Text('Jun');
                              case 6:
                                return Text('Jul');
                              case 7:
                                return Text('Aug');
                              case 8:
                                return Text('Sep');
                              case 9:
                                return Text('Oct');
                              case 10:
                                return Text('Nov');
                              case 11:
                                return Text('Dec');
                              default:
                                return Text('');
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
                          color: KColorPrimer.withOpacity(0.3),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border(
                        left: BorderSide(color: KColorPrimer, width: 2),
                        bottom: BorderSide(color: KColorPrimer, width: 2),
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

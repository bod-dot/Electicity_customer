import 'package:flutter/material.dart';

import '../helper/Constans.dart';
import 'MyTextOut.dart';
class Electricitybillcard extends StatelessWidget {
   Electricitybillcard({required this.History,required this.Consumption,required this.money});

   final String History;
   final double  Consumption;
   final double  money;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 280,
        width: 190,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: KColorBlack.withOpacity(0.3),
                blurRadius: 7,
                spreadRadius: 3,
                offset: const Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: MytextLable(
                  value: History,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey[400],),
            Row(
              children: [
                Icon(Icons.electric_bolt, color: Colors.amber, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: MytextLable(
                    value: Consumption.toString()+" kWh",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MytextLable(
                    value: "ريال يمني ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),
                MytextLable(
                  value: money.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    )
    ;
  }
}

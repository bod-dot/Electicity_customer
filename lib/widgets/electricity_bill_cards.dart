import 'package:flutter/material.dart';

import '../helper/my_constans.dart';
import 'my_text_out.dart';
class Electricitybillcard extends StatelessWidget {
  const  Electricitybillcard({super.key, required this.history,required this.consumption,required this.money});

   final String history;
   final double  consumption;
   final double  money;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 280,
        width: 190,
        padding:const EdgeInsets.all(16),
        margin:const EdgeInsets.all(10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: kColorBlack.withOpacity(0.3),
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
                  value: history,
                  style:const  TextStyle(
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
              const  Icon(Icons.electric_bolt, color: Colors.amber, size: 20),
               const SizedBox(width: 8),
                Expanded(
                  child: MytextLable(
                    value: "$consumption kWh",
                    style:const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
           const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Expanded(
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

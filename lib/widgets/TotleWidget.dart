import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/Constans.dart';
import '../helper/screenSize.dart';
import 'MyListTile.dart';
import 'MyTextOut.dart';

class Totlewidget extends StatelessWidget {
  Totlewidget({super.key, required this.Totile, required this.onTop});

  final double Totile;
  final VoidCallback onTop;
  Screensize screen = Screensize();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screen.SizeScreen(context, 0.4, 0.6),
      width: screen.SizeScreen(context, 0.4, 0.6),
      margin: EdgeInsets.all(screen.SizeScreen(context, 0.02, 0.04)),
      padding: EdgeInsets.all(screen.SizeScreen(context, 0.01, 0.03)),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: KColorPrimer.withOpacity(0.3), // ظل باستخدام اللون الأساسي مع شفافية
            blurRadius: 7,
            spreadRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
        color: KColorFoured, // خلفية خفيفة (أزرق ناعم)
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Divider(endIndent: 20, indent: 20),
          MytextLable(
            value: "اجمالي المتبقي عليكم: ${Totile}",
            color: KColorPrimer, // نص بلون أزرق داكن ليتناسق مع باقي النظام
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MyListTile(
              text: "ادفع الان",
              icon: Icon(Icons.payments_outlined),
              fontSize: screen.SizeScreen(context, 0.025, 0.04),
              circular: 10,
              iconColor: Colors.white, // أيقونة بيضاء لتميّزها على الخلفية
              textColor: Colors.white, // نص أبيض ليتباين مع الخلفية الداكنة
              backgroundColor: KColorPrimer, // زر بخلفية أزرق داكن
              shadowColor: KColorPrimer.withOpacity(0.5),
              action: onTop,
            ),
          ),
          Divider(endIndent: 20, indent: 20),
        ],
      ),
    );
  }
}

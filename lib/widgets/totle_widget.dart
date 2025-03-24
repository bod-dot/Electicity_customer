import 'package:flutter/material.dart';
import '../helper/my_constans.dart';
import '../helper/screen_size.dart';
import 'my_listtile.dart';
import 'my_text_out.dart';

class Totlewidget extends StatelessWidget {
   Totlewidget({super.key, required this.totile, required this.onTop});

  final double totile;
  final VoidCallback onTop;
 final Screensize screen = Screensize();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screen.sizeScreen(context, 0.4, 0.6),
      width: screen.sizeScreen(context, 0.4, 0.6),
      margin: EdgeInsets.all(screen.sizeScreen(context, 0.02, 0.04)),
      padding: EdgeInsets.all(screen.sizeScreen(context, 0.01, 0.03)),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kColorPrimer.withOpacity(0.3), // ظل باستخدام اللون الأساسي مع شفافية
            blurRadius: 7,
            spreadRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
        color: kColorFoured, // خلفية خفيفة (أزرق ناعم)
        borderRadius:const  BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        const  Divider(endIndent: 20, indent: 20),
          MytextLable(
            value: "اجمالي المتبقي عليكم: $totile",
            color: kColorPrimer, // نص بلون أزرق داكن ليتناسق مع باقي النظام
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MyListTile(
              text: "ادفع الان",
              icon:const Icon(Icons.payments_outlined),
              fontSize: screen.sizeScreen(context, 0.025, 0.04),
              circular: 10,
              iconColor: Colors.white, // أيقونة بيضاء لتميّزها على الخلفية
              textColor: Colors.white, // نص أبيض ليتباين مع الخلفية الداكنة
              backgroundColor: kColorPrimer, // زر بخلفية أزرق داكن
              shadowColor: kColorPrimer.withOpacity(0.5),
              action: onTop,
            ),
          ),
         const Divider(endIndent: 20, indent: 20),
        ],
      ),
    );
  }
}

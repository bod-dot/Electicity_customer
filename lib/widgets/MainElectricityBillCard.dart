import 'package:customer/helper/screenSize.dart';
import 'package:customer/models/Reading.dart';
import 'package:flutter/material.dart';

import '../helper/Constans.dart';
import 'InfoRow.dart';
import 'MyListTile.dart';
import 'MyTextOut.dart';

class Mainelectricitybillcard extends StatelessWidget {
  Mainelectricitybillcard({
    super.key,
    required this.Reading,
    this.onTop,
    required this.checkIsListOn,
  });

  final bool checkIsListOn;
  final ReadingsModel Reading;
  final VoidCallback? onTop;
  Screensize screen = Screensize();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(screen.SizeScreen(context, 0.02, 0.04)),
      padding: EdgeInsets.all(screen.SizeScreen(context, 0.01, 0.03)),
      decoration: BoxDecoration(
        // استخدام لون أساسي للظل من نفس لوحة الألوان
        boxShadow: [
          BoxShadow(
            color: KColorPrimer.withOpacity(0.3),
            blurRadius: 7,
            spreadRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
        // تغيير لون الخلفية إلى درجة هادئة من اللون الأزرق
        color: KColorFoured,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MytextLable(
            value: checkIsListOn
                ? "  فاتوره الكهرباء الاخيرة "
                : " فاتوره الكهرباء السابقة  ",
            // استخدام اللون الأساسي للنص ليتماشى مع التصميم
            color: KColorPrimer,
          ),
          MytextLable(
            value:
            '${Reading.Date.year}/${Reading.Date.month}/${Reading.Date.day}',
            color: KColorPrimer,
          ),
          Divider(),
          Inforow(
            value: Reading.CurrentReading.toString(),
            lable: " : قراه العداد الحالية",
          ),
          Inforow(
            value: Reading.PreviousReading.toString(),
            lable: " : قراه العداد السابقة",
          ),
          Inforow(
            value: "${Reading.GetUsageKilo()} kWh",
            lable: " :              الاستهلاك",
          ),
          Inforow(
            value: " ${Reading.TotalDuesInThisReading.toString()} ريال ",
            lable: " :                المتاخر ",
          ),
          Inforow(
            value: "${Reading.PriceOfKilo} W",
            lable: " :          سعر الوحدة",
          ),
          Inforow(
            value: "${Reading.GetTotalBill()} ريال",
            lable: " :     اجمالي الفاتوره",
          ),
          checkIsListOn
              ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MyListTile(
              text: "ادفع الان",
              icon: Icon(Icons.payments_outlined),
              fontSize: screen.SizeScreen(context, 0.025, 0.04),
              circular: 10,
              // جعل أيقونة ونص الزر أبيض ليتباين مع الخلفية الداكنة
              iconColor: Colors.white,
              textColor: Colors.white,
              // استخدام اللون الأساسي كخلفية للزر
              backgroundColor: KColorPrimer,
              shadowColor: KColorPrimer.withOpacity(0.5),
              action: onTop,
            ),
          )
              : SizedBox.shrink(),
          Divider(),
        ],
      ),
    );
  }
}

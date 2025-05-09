import 'package:customer/helper/screen_size.dart';
import 'package:customer/models/my_reading.dart';
import 'package:flutter/material.dart';
import '../helper/my_constans.dart';
import 'info_row.dart';
import 'my_listtile.dart';
import 'my_text_out.dart';

class Mainelectricitybillcard extends StatelessWidget {
   Mainelectricitybillcard({
    super.key,
    required this.reading,
    this.onTop,
     this.checkIsListOn=false,
      this.many,
  });

  final bool checkIsListOn;
  final ReadingsModel reading;
  final VoidCallback? onTop;
 final Screensize screen = Screensize();
 final double? many;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(screen.sizeScreen(context, 0.02, 0.04)),
      padding: EdgeInsets.all(screen.sizeScreen(context, 0.01, 0.03)),
      decoration: BoxDecoration(
        // استخدام لون أساسي للظل من نفس لوحة الألوان
        boxShadow: [
          BoxShadow(
            color: kColorPrimer.withOpacity(0.3),
            blurRadius: 7,
            spreadRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
        // تغيير لون الخلفية إلى درجة هادئة من اللون الأزرق
        color: kColorFoured,
        borderRadius:const  BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         Row(
          mainAxisAlignment:many == null ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
           children: [
          const  SizedBox.shrink(),
            
             Column(children: [
                MytextLable(
               value: checkIsListOn
                   ? "  فاتوره الكهرباء الاخيرة "
                   : " فاتوره الكهرباء السابقة  ",
             
               color: kColorPrimer,
             ),
             MytextLable(
               value:
               '${reading.date.year}/${reading.date.month}/${reading.date.day}',
               color: kColorPrimer,
             ),
             ],),
         ( many != null && checkIsListOn )?  const  Icon(Icons.check_box_outlined,color: Colors.green,size: 35,):const  SizedBox.shrink(),
            
           ],
         ),
        const  Divider(),
          Inforow(
            value: reading.currentReading.toString(),
            lable: " :           قراه العداد الحالية",
          ),
          Inforow(
            value: reading.previousReading.toString(),
            lable: " :          قراه العداد السابقة",
          ),
          Inforow(
            value: "${reading.getUsageKilo()} kW",
            lable: " :                       الاستهلاك",
          ),
          Inforow(
            value:(checkIsListOn && many==null )?    " ${reading.customerTotalDues.toString()} ريال " :" ${reading.totalDuesInThisReading.toString()} ريال " ,
            lable: " :                          المتاخر ",
          ),
          Inforow(
            value: "${reading.priceOfKilo} ريال",
            lable: " :                    سعر الوحدة",
          ),
          Inforow(
           value:  "${reading.getTotalBill()} "  "ريال",
            lable: " :               اجمالي الفاتوره",
          ),
           ( many != null && checkIsListOn ) ?  Column(
            children: [
               const  Divider(),
              Inforow(
               
                value: "$many "  "ريال",
                lable: " :                        تم الدفع",
              ),
              Inforow(
                value: "${reading.customerTotalDues} ريال",
                lable: " :اجمالي الفاتوره بعد الدفع",
                ),
                 const  Divider(),
            ],
          ):const SizedBox.shrink()
         ,
        
          
          checkIsListOn
              ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MyListTile(
              text: "ادفع الان",
              icon:const Icon(Icons.payments_outlined),
              fontSize: screen.sizeScreen(context, 0.025, 0.04),
              circular: 10,
              // جعل أيقونة ونص الزر أبيض ليتباين مع الخلفية الداكنة
              iconColor: Colors.white,
              textColor: Colors.white,
              // استخدام اللون الأساسي كخلفية للزر
              backgroundColor: kColorPrimer,
              shadowColor: kColorPrimer.withOpacity(0.5),
              action: onTop,
            ),
          )
              :const SizedBox.shrink(),
        const  Divider(),
        ],
      ),
    );
  }
}

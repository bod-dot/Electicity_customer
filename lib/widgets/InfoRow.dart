import 'package:customer/helper/Constans.dart'; // تأكد من وجود الثوابت هنا
import 'package:customer/widgets/MyTextOut.dart';
import 'package:flutter/material.dart';

class Inforow extends StatelessWidget {
  Inforow({
    required this.value,
    required this.lable,
  });

  final String value;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: MytextLable(
            value: value,
            color: KColorPrimer,
          ),
        ),
        MytextLable(
          value: lable,
          color: KColorPrimer,
        ),
      ],
    );
  }
}

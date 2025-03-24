
import 'package:flutter/material.dart';

import '../helper/my_constans.dart';
import 'my_text_out.dart';

class Inforow extends StatelessWidget {
const  Inforow({super.key, 
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
            color: kColorPrimer,
          ),
        ),
        MytextLable(
          value: lable,
          color: kColorPrimer,
        ),
      ],
    );
  }
}

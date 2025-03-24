
import 'package:flutter/material.dart';



import 'my_constans.dart';

class MyDate {
  void chooesDatePicker({
    required TextEditingController date,
    required List<dynamic> allReadings,
    required BuildContext context,
  }) async {
    List<DateTime> allowedDates = [];
    for (int i = 0; i < allReadings.length; i++) {
      allowedDates.add(allReadings[i].date);
    }

    DateTime initialDate =
    allowedDates.isNotEmpty ? allowedDates.first : DateTime.now();

    DateTime? dateChooes = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: allowedDates.first,
      lastDate: allowedDates.last,
      selectableDayPredicate: (DateTime day) {
        return allowedDates.any((date) =>
        date.year == day.year &&
            date.month == day.month &&
            date.day == day.day);
      },
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme:const  ColorScheme.light(
              primary: kColorPrimer,
              onPrimary: kColorwhite,
              surface: kColorFoured,
              onSurface: kColorBlack,
            ),

          ),
          child: child!,
        );
      },
    );

    if (dateChooes != null) {
      date.text =
      '${dateChooes.year}-${dateChooes.month.toString().padLeft(2, '0')}-${dateChooes.day.toString().padLeft(2, '0')}';
    }
  }



  List<dynamic> getRangByDate({
    required List<dynamic> data,
    required DateTime from,
    required DateTime  to,

  }) {


     data = data.where((e) {
      return e.date.compareTo(from) >= 0 && e.date.compareTo(to) <= 0;
    }).toList();


    data.sort((a, b) => a.date.compareTo(b.date));

    return data;

  }


}

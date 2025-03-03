import 'package:customer/models/Payment.dart';
import 'package:customer/models/Reading.dart';
import 'package:customer/widgets/MySnackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'Constans.dart';

class MyDate {
  void chooesDatePicker({
    required TextEditingController date,
    required List<dynamic> allReadings,
    required BuildContext context,
  }) async {
    List<DateTime> allowedDates = [];
    for (int i = 0; i < allReadings.length; i++) {
      allowedDates.add(allReadings[i].Date);
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
            colorScheme: ColorScheme.light(
              primary: KColorPrimer,
              onPrimary: KColorwhite,
              surface: KColorFoured,
              onSurface: KColorBlack,
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



  List<dynamic> GetRangByDate({
    required List<dynamic> Data,
    required DateTime From,
    required DateTime  To,

  }) {


     Data = Data.where((e) {
      return e.Date.compareTo(From) >= 0 && e.Date.compareTo(To) <= 0;
    }).toList();


    Data.sort((a, b) => a.Date.compareTo(b.Date));

    return Data;

  }


}

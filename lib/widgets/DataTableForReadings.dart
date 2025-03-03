import 'package:flutter/material.dart';

import '../helper/screenSize.dart';
import '../models/Reading.dart';

class DatatableForReadings extends StatelessWidget {
  DatatableForReadings({super.key, required this.result});

  final List<dynamic> result;
  Screensize screen = Screensize();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DataTable(
        border: TableBorder(
          horizontalInside: BorderSide(width: 1, color: Colors.grey.shade300),
          top: BorderSide(width: 1.5, color: Colors.black),
          bottom: BorderSide(width: 1.5, color: Colors.black),
          verticalInside: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
        columnSpacing: 15,
        headingRowColor: WidgetStateProperty.resolveWith(
          (states) => Colors.blueGrey.shade100,
        ),
        columns: const [
          DataColumn(
              label: Text("رقم الفاتوره",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(
              label: Text("تاريخ الفاتوره",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(
              label: Text("قراه العداد",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(
              label: Text("المتأخرة",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(
              label: Text("الاستهلاك",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(
              label: Text("سعر الوحدة",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(
              label: Text("اجمالي الفاتورة",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        ],
        rows: [
          ...result.map((reading) {
            return DataRow(cells: [
              DataCell(Text(reading.ReadingID.toString(),
                  style: TextStyle(
                      fontSize: screen.SizeScreen(context, 0.018, 0.02)))),

              DataCell(Text(

                  '${reading.Date.year}-${reading.Date.month}-${reading.Date.day}',
                  style: TextStyle(
                      fontSize: screen.SizeScreen(context, 0.018, 0.02)))),
              DataCell(Text(reading.CurrentReading.toString(),
                  style: TextStyle(
                      fontSize: screen.SizeScreen(context, 0.018, 0.02)))),
              DataCell(Text(reading.TotalDuesInThisReading.toString(),
                  style: TextStyle(
                      fontSize: screen.SizeScreen(context, 0.018, 0.02)))),
              DataCell(Text(reading.GetUsageKilo().toString(),
                  style: TextStyle(
                      fontSize: screen.SizeScreen(context, 0.018, 0.02)))),
              DataCell(Text(reading.PriceOfKilo.toString(),
                  style: TextStyle(
                      fontSize: screen.SizeScreen(context, 0.018, 0.02)))),
              DataCell(Text(reading.GetTotalBill().toString(),
                  style: TextStyle(
                      fontSize: screen.SizeScreen(context, 0.018, 0.02)))),
            ]);
          }).toList(),
          // **إضافة صف الإجمالي**
          DataRow(
            cells: [
              DataCell(Text("الإجمالي",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
              DataCell(Text("")),
              DataCell(Text("")),
              DataCell(Text("")),
              DataCell(Text("")),
              DataCell(Text("")),
              DataCell(Text(
                result
                    .fold(0.0, (sum, reading) => sum + reading.GetTotalBill())
                    .toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
            ],
          ),
        ],
      ),
    );
  }
}

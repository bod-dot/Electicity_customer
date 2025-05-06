import 'package:flutter/material.dart';

import '../helper/screen_size.dart';


class DatatableForReadings extends StatelessWidget {
   DatatableForReadings({super.key, required this.result});

  final List<dynamic> result;
 final Screensize screen = Screensize();

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
          top:const  BorderSide(width: 1.5, color: Colors.black),
          bottom:const  BorderSide(width: 1.5, color: Colors.black),
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
              label: Text("القراءه السابقة",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(
              label: Text("القراءه الحالية",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        
          DataColumn(
              label: Text("الاستهلاك",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(
              label: Text("سعر الوحدة",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                   DataColumn(
              label: Text("المتأخرة",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(
              label: Text("اجمالي الفاتورة",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        ],
        rows: [
          ...result.map((reading) {
            return DataRow(cells: [
              DataCell(Text(reading.readingID.toString(),
                  style: TextStyle(
                      fontSize: screen.sizeScreen(context, 0.018, 0.02)))),

              DataCell(Text(

                  '${reading.date.year}-${reading.date.month}-${reading.date.day}',
                  style: TextStyle(
                      fontSize: screen.sizeScreen(context, 0.018, 0.02)))),
                       DataCell(Text(reading.previousReading.toString(),
                  style: TextStyle(
                      fontSize: screen.sizeScreen(context, 0.018, 0.02)))),
              DataCell(Text(reading.currentReading.toString(),
                  style: TextStyle(
                      fontSize: screen.sizeScreen(context, 0.018, 0.02)))),
             
              DataCell(Text(reading.getUsageKilo().toString(),
                  style: TextStyle(
                      fontSize: screen.sizeScreen(context, 0.018, 0.02)))),
              DataCell(Text(reading.priceOfKilo.toString(),
                  style: TextStyle(
                      fontSize: screen.sizeScreen(context, 0.018, 0.02)))),
                       DataCell(Text(reading.totalDuesInThisReading.toString(),
                  style: TextStyle(
                      fontSize: screen.sizeScreen(context, 0.018, 0.02)))),
              DataCell(Text("${reading.getTotalBill()} ريال",
                  style: TextStyle(
                      fontSize: screen.sizeScreen(context, 0.018, 0.02)))),
            ]);
          }),
        
          DataRow(
            cells: [
             const DataCell(Text("الإجمالي",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
            const  DataCell(Text("")),
            const  DataCell(Text("")),
             const DataCell(Text("")),
             const DataCell(Text("")),
             const DataCell(Text("")),
             const DataCell(Text("")),
              DataCell(Text(
               "${ result
                    .fold(0.0, (sum, reading) => sum + reading.getTotalBill())
                    .toString()} ريال",
                style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
            ],
          ),
        ],
      ),
    );
  }
}

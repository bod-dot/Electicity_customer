import 'package:customer/models/my_reading.dart';
import 'package:flutter/material.dart';

import '../helper/screen_size.dart';


class Datatableforalldata extends StatelessWidget {
   Datatableforalldata({super.key, required this.result});

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
          top:const BorderSide(width: 1.5, color: Colors.black),
          bottom:const BorderSide(width: 1.5, color: Colors.black),
          verticalInside: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
        columnSpacing: 15,
        headingRowColor: WidgetStateProperty.resolveWith(
              (states) => Colors.blueGrey.shade100,
        ),

        columns: const [
          DataColumn(
              label: Text("رقم العملية",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(
              label: Text("تاريخ العملية",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(
              label: Text("نوع العملية ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(
              label: Text("الملبغ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(
              label: Text("تفاصيل",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),

        ],
        rows: [
          ...result.map((data) {
            return DataRow(cells: [
              DataCell(Text((data is ReadingsModel )?data.readingID.toString():data.customerMovementID.toString(),
                  style: TextStyle(
                      fontSize: screen.sizeScreen(context, 0.018, 0.02)))),

              DataCell(Text(

                  '${data.date.year}-${data.date.month}-${data.date.day}',
                  style: TextStyle(
                      fontSize: screen.sizeScreen(context, 0.018, 0.02)))),
              DataCell(Text((data is ReadingsModel )?'قراءة  فاتورة':'دفع سند',
                  style: TextStyle(
                      fontSize: screen.sizeScreen(context, 0.018, 0.02)))),
              DataCell(Text((data is ReadingsModel )?'${data.getTotalBill()}-':data.totalDuesAfterPaying.toString(),
                  style: TextStyle(
                      fontSize: screen.sizeScreen(context, 0.018, 0.02)))),
              DataCell(Text((data is ReadingsModel )?'عليكم فاتوره كهرباء ':'لكم سند قبض   ',
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
              DataCell(Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  result
                      .fold(0.0, (sum, data) => sum + ((data is ReadingsModel) ? -data.getTotalBill():data.customerMovementPaiedAmount))
                      .toString(),
                  style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              )),
             const DataCell(Text("")),



            ],
          ),
        ],
      ),
    );
  }
}

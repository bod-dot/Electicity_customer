import 'package:customer/models/Reading.dart';
import 'package:flutter/material.dart';

import '../helper/screenSize.dart';


class Datatableforalldata extends StatelessWidget {
  Datatableforalldata({super.key, required this.result});

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
          ...result.map((Data) {
            return DataRow(cells: [
              DataCell(Text((Data is ReadingsModel )?Data.ReadingID.toString():Data.CustomerMovementID.toString(),
                  style: TextStyle(
                      fontSize: screen.SizeScreen(context, 0.018, 0.02)))),

              DataCell(Text(

                  '${Data.Date.year}-${Data.Date.month}-${Data.Date.day}',
                  style: TextStyle(
                      fontSize: screen.SizeScreen(context, 0.018, 0.02)))),
              DataCell(Text((Data is ReadingsModel )?'قراءة  فاتورة':'دفع سند',
                  style: TextStyle(
                      fontSize: screen.SizeScreen(context, 0.018, 0.02)))),
              DataCell(Text((Data is ReadingsModel )?'${Data.GetTotalBill()}-':Data.TotalDuesAfterPaying.toString(),
                  style: TextStyle(
                      fontSize: screen.SizeScreen(context, 0.018, 0.02)))),
              DataCell(Text((Data is ReadingsModel )?'عليكم فاتوره كهرباء ':'لكم سند قبض   ',
                  style: TextStyle(
                      fontSize: screen.SizeScreen(context, 0.018, 0.02)))),


            ]);
          }).toList(),

          DataRow(
            cells: [
              DataCell(Text("الإجمالي",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
              DataCell(Text("")),
              DataCell(Text("")),
              DataCell(Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  result
                      .fold(0.0, (sum, Data) => sum + ((Data is ReadingsModel) ? -Data.GetTotalBill():Data.CustomerMovementPaiedAmount))
                      .toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              )),
              DataCell(Text("")),



            ],
          ),
        ],
      ),
    );
  }
}

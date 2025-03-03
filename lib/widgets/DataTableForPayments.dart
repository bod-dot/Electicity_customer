
import 'package:customer/models/Payment.dart';
import 'package:flutter/material.dart';

import '../helper/screenSize.dart';
import '../models/Reading.dart';
class DatatableforPayments extends StatelessWidget {
  DatatableforPayments({super.key, required this.result});
  final  List<dynamic> result;
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
          DataColumn(label: Text(
              " رقم السند ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(label: Text(" تاريخ التسديد", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(label: Text("مبلغ السند ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(label: Text(" طريقة الدفع", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),

          DataColumn(label: Text("الرصيد المتبقي ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          DataColumn(label: Text(" البيان", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        ],
        rows: [
          ...result.map((payment) {
            return DataRow(cells: [
              DataCell(Text(payment.CustomerMovementID.toString(),
                  style: TextStyle(fontSize: screen.SizeScreen(context, 0.018, 0.02)))),
              DataCell(Text('${payment.Date.year}-${payment.Date.month}-${payment.Date.day}',
                  style: TextStyle(fontSize: screen.SizeScreen(context, 0.018, 0.02)))),

              DataCell(Text(payment.CustomerMovementPaiedAmount.toString(),
                  style: TextStyle(fontSize: screen.SizeScreen(context, 0.018, 0.02)))),
              DataCell(Text(payment.CustomerMovementType ==0?"دفع الكتروني":"دفع من احد فروعنا",
                  style: TextStyle(fontSize: screen.SizeScreen(context, 0.018, 0.02)))),
              DataCell(Text(payment.TotalDuesAfterPaying.toString(),
                  style: TextStyle(fontSize: screen.SizeScreen(context, 0.018, 0.02)))),
              DataCell(Text(payment.CustomerMovementNote,
                  style: TextStyle(fontSize: screen.SizeScreen(context, 0.018, 0.02)))),
            ]);
          }).toList(),

          DataRow(
            cells: [
              DataCell(Text("الإجمالي", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
              DataCell(Text("")),
              DataCell(Text(
                result.fold(0.0, (sum, Payment) => sum + Payment.CustomerMovementPaiedAmount).toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
              DataCell(Text("")),
              DataCell(Text("")),
              DataCell(Text("")),

            ],
          ),
        ],
      ),
    );
  }
}

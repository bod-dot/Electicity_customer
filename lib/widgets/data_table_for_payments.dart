
import 'package:flutter/material.dart';

import '../helper/screen_size.dart';
class DatatableforPayments extends StatelessWidget {
   DatatableforPayments({super.key, required this.result});
  final  List<dynamic> result;
final  Screensize screen = Screensize();
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
              DataCell(Text(payment.customerMovementID.toString(),
                  style: TextStyle(fontSize: screen.sizeScreen(context, 0.018, 0.02)))),
              DataCell(Text('${payment.date.year}-${payment.date.month}-${payment.date.day}',
                  style: TextStyle(fontSize: screen.sizeScreen(context, 0.018, 0.02)))),

              DataCell(Text(payment.customerMovementPaiedAmount.toString(),
                  style: TextStyle(fontSize: screen.sizeScreen(context, 0.018, 0.02)))),
              DataCell(Text(payment.customerMovementType ==0?"دفع الكتروني":"دفع من احد فروعنا",
                  style: TextStyle(fontSize: screen.sizeScreen(context, 0.018, 0.02)))),
              DataCell(Text(payment.totalDuesAfterPaying.toString(),
                  style: TextStyle(fontSize: screen.sizeScreen(context, 0.018, 0.02)))),
              DataCell(Text(payment.customerMovementNote,
                  style: TextStyle(fontSize: screen.sizeScreen(context, 0.018, 0.02)))),
            ]);
          }),

          DataRow(
            cells: [
            const   DataCell(Text("الإجمالي", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
             const  DataCell(Text("")),
              DataCell(Text(
                result.fold(0.0, (sum, payment) => sum + payment.customerMovementPaiedAmount).toString(),
                style:const  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
             const  DataCell(Text("")),
             const  DataCell(Text("")),
             const  DataCell(Text("")),

            ],
          ),
        ],
      ),
    );
  }
}

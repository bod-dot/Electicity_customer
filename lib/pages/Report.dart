import 'package:customer/controllers/Get_All_Payments.dart';
import 'package:customer/helper/Constans.dart';
import 'package:customer/helper/screenSize.dart';
import 'package:customer/models/Payment.dart';
import 'package:customer/models/Reading.dart';
import 'package:customer/widgets/DataTableForAllData.dart';
import 'package:customer/widgets/DataTableForPayments.dart';
import 'package:customer/widgets/DataTableForReadings.dart';
import 'package:customer/widgets/MyButton.dart';
import 'package:customer/widgets/MyDropDown.dart';
import 'package:customer/widgets/MySnackBar.dart';
import 'package:customer/widgets/TextInput.dart';
import 'package:customer/helper/chooesDateWidgite.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  static String Id = 'Report';

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  Screensize screen = Screensize();
  TextEditingController fromdate = TextEditingController();
  TextEditingController todate = TextEditingController();

  MyDate Obj_date = MyDate();
  List<dynamic> resultAllData = [];
  List<PaymentModel> LiPayment = [];
  List<dynamic> LiAllData = [];
  String selectedValue = 'القراءات';
  late List<ReadingsModel> LiReadings;
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    GetDate();
    super.initState();
  }

  void GetDate() async {
    print(++count);
    SharedPreferences share = await SharedPreferences.getInstance();
    int customerID = share.getInt('customerID') ?? 0;

    LiPayment = await GetAllPayments().GetPayments(CustomerID: customerID);
    LiReadings =
        ModalRoute.of(context)!.settings.arguments as List<ReadingsModel>;
    LiAllData = [...LiPayment, ...LiReadings];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('التقارير',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: KColorPrimer,
          elevation: 5,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Mydropdown(
                          fromdate: fromdate,
                          todate: todate,
                          onValueChanged: (String newValue) {
                            selectedValue = newValue;
                          },
                          onResultAllDataChanged: () {
                            resultAllData = [];
                          }),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: MyTextinput(
                              controller: fromdate,
                              readOnly: true,
                              onTop: () {
                                if(LiPayment.isEmpty || LiReadings.isEmpty)
                                  {
                                    Mysnackbar().showSnackbarCheck(context: context, Message: "ليس لديك بيانات بعد");

                                  }else
                                Obj_date.chooesDatePicker(
                                    date: fromdate,
                                    context: context,
                                    allReadings: selectedValue == 'القراءات'
                                        ? LiReadings
                                        : selectedValue == 'المدفوعات'
                                        ? LiPayment
                                        : LiAllData);
                              },
                              text: "من",
                              Texticon: const Icon(Icons.date_range,
                                  color: Colors.blueGrey),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: MyTextinput(
                              controller: todate,
                              readOnly: true,
                              onTop: () {
                                if(LiPayment.isEmpty || LiReadings.isEmpty)
                                {
                                  Mysnackbar().showSnackbarCheck(context: context, Message: "ليس لديك بيانات بعد");

                                }else
                                  Obj_date.chooesDatePicker(
                                      date: todate,
                                      context: context,
                                      allReadings: selectedValue == 'القراءات'
                                          ? LiReadings
                                          : selectedValue == 'المدفوعات'
                                          ? LiPayment
                                          : LiAllData);
                              },
                              text: "إلى",
                              Texticon: const Icon(Icons.date_range,
                                  color: Colors.blueGrey),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Mybutton(
                          text: 'عرض التقرير',
                          action: () async {
                            var from;
                            var to;
                            if (fromdate.text.isNotEmpty &&
                                todate.text.isNotEmpty) {
                              from = DateTime.parse(fromdate.text);
                              to = DateTime.parse(todate.text);
                              if (from.isAfter(to)) {
                                Mysnackbar().showSnackbarError(
                                    context: context,
                                    Message: "التاريخ غير متوافق");
                              } else {
                                resultAllData = Obj_date.GetRangByDate(
                                  From: from,
                                  To: to,
                                  Data: selectedValue == 'القراءات'
                                      ? LiReadings
                                      : selectedValue == 'المدفوعات'
                                          ? LiPayment
                                          : LiAllData,
                                );
                                setState(() {});
                              }
                            } else {
                              Mysnackbar().showSnackbarCheck(
                                  context: context,
                                  Message: "يرجاء اختيار التاريخ");
                            }
                          },
                          color: KColorPrimer,
                          width: 90,
                          height: 15,
                          fontSize: 20,
                          colorFont: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Divider(
                  thickness: 1.5,
                  color: Colors.grey.shade400,
                  endIndent: 10,
                  indent: 10,
                ),
                const SizedBox(height: 10),
                (resultAllData.isNotEmpty)
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: selectedValue == 'القراءات'
                            ? DatatableForReadings(result: resultAllData)
                            : selectedValue == 'المدفوعات'
                                ? DatatableforPayments(result: resultAllData)
                                : Datatableforalldata(result: resultAllData),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

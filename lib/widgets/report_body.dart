import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit/home_cubit.dart';
import '../cubit/report/report_cubit.dart';
import '../helper/chooes_date_widgite.dart';
import '../helper/screen_size.dart';
import '../models/my_payment.dart';
import '../models/my_reading.dart';
import '../widgets/data_table_for_all_data.dart';
import '../widgets/data_table_for_payments.dart';
import '../widgets/data_table_for_readings.dart';
import '../widgets/my_button.dart';
import '../widgets/my_dropdown.dart';
import '../widgets/text_input.dart';
import 'package:customer/helper/my_constans.dart';

class ReportBody extends StatefulWidget {
  const ReportBody({super.key});

  @override
  State<ReportBody> createState() => _ReportBodyState();
}

class _ReportBodyState extends State<ReportBody> {
  Screensize screen = Screensize();
  TextEditingController fromdate = TextEditingController();
  TextEditingController todate = TextEditingController();
  MyDate objData = MyDate();
  List<dynamic> resultAllData = [];
  List<PaymentModel> liPayment = [];
  List<dynamic> liAllData = [];
  String selectedValue = 'القراءات';
  late List<ReadingsModel> liReadings;
  int count = 0;
  @override
  void initState() {
    
    getData();
    super.initState();
  }

  void getData()  {
    liReadings = BlocProvider.of<HomeCubit>(context).liReading;
   
    liPayment = BlocProvider.of<HomeCubit>(context).liPayment;  
 

    liAllData = [ ...liReadings,...liPayment];
    liReadings.sort((a, b) => a.date.compareTo(b.date));
    liPayment.sort((a, b) => a.date.compareTo(b.date));
   liAllData.sort((a, b) => a.date.compareTo(b.date));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        return SingleChildScrollView(
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
                               labelStyle:const TextStyle(color: Colors.black),
                               style:const  TextStyle(color: Colors.black),
                              controller: fromdate,
                              readOnly: true,
                              onTop: () {
                                if (BlocProvider.of<ReportCubit>(context)
                                    .checkData(

                                        typeReport: selectedValue,
                                        liReading: liReadings,
                                        liPayment: liPayment)) {
                                  objData.chooesDatePicker(
                                      date: fromdate,
                                      context: context,
                                      allReadings: selectedValue == 'القراءات'
                                          ? liReadings
                                          : selectedValue == 'المدفوعات'
                                              ? liPayment
                                              : liAllData);
                                }
                              },
                              text: "من",
                              texticon: const Icon(Icons.date_range,
                                  color: Colors.blueGrey),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: MyTextinput(
                              labelStyle:const TextStyle(color: Colors.black),
                               style:const  TextStyle(color: Colors.black),
                              controller: todate,
                              readOnly: true,
                              onTop: () {
                                if (BlocProvider.of<ReportCubit>(context)
                                    .checkData(
                                        typeReport: selectedValue,
                                        liReading: liReadings,
                                        liPayment: liPayment)) {
                                  objData.chooesDatePicker(
                                      date: todate,
                                      context: context,
                                      allReadings: selectedValue == 'القراءات'
                                          ? liReadings
                                          : selectedValue == 'المدفوعات'
                                              ? liPayment
                                              : liAllData);
                                }
                              },
                              text: "إلى",
                              texticon: const Icon(Icons.date_range,
                                  color: Colors.blueGrey),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: MyButton(
                          
                          text: 'عرض التقرير',
                          action: () async {
                          

                          resultAllData=   BlocProvider.of<ReportCubit>(context)
                                .getUserReports(
                                  liPayment: liPayment,
                                 liAllData: liAllData,
                                 liReadings: liReadings,
                                    typeReport: selectedValue,
                                    from: fromdate.text,
                                    to: todate.text);
                          },
                          color: kColorPrimer,
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
                resultAllData.isNotEmpty?
                 SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        
                        child:
                        state is ReportReading?
                            DatatableForReadings(result: resultAllData)
                            : state is ReportPayment
                                ? DatatableforPayments(result: resultAllData)
                                : Datatableforalldata(result: resultAllData),
                      ):const SizedBox.shrink(),
                  
              ],
            ),
          ),
        );
      },
    );
  }
}

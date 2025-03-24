import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:customer/cubit/report/report_cubit.dart';
import 'package:customer/widgets/report_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../helper/my_constans.dart';
import '../widgets/my_snackbar.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  static String id = 'Report';

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => ReportCubit(),
        child: BlocListener<ReportCubit, ReportState>(
          listener: (context, state) {
            if (state is ReportWrongDate) {
              Mysnackbar().showSnackbarError(
                  context: context,
                  message: "التاريخ غير متوافق",
                  contentType: ContentType.warning,
                  title: "ملاحطة");
            } else if (state is ReportNoDateChooes) {
              Mysnackbar().showSnackbarError(
                  context: context,
                  message: "يرجاء اختيار التاريخ",
                  contentType: ContentType.warning,
                  title: "ملاخطة");
            } else if (state is ReportNoDataPayment) {
              Mysnackbar().showSnackbarError(
                  context: context,
                  message: "لا يوجد اي تسديد بيانات بعد ",
                  contentType: ContentType.warning,
                  title: "ملاحظة");
            } else if (state is ReportNoDataReading) {
              Mysnackbar().showSnackbarError(
                  context: context,
                  message: "لا يوجد اي قراءات   بعد ",
                  contentType: ContentType.warning,
                  title: "ملاحظة");
            }
          },
          child:  Scaffold(
              appBar: AppBar(
                title: const Text('التقارير',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                centerTitle: true,
                backgroundColor: kColorPrimer,
                elevation: 5,
              ),
              body:const ReportBody() 
            ),
        ),
      ),
    );
  }
}

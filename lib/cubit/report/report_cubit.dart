import 'package:bloc/bloc.dart';
import 'package:customer/helper/chooes_date_widgite.dart';
import 'package:customer/helper/my_api.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/get_all_payments.dart';
import '../../models/my_payment.dart';
import '../../models/my_reading.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial());
    List<dynamic> resultAllData = [];
  
  List<dynamic> liAllData = [];

  

  List<dynamic> getUserReports({required String typeReport,required String from,required String to,required  List<ReadingsModel> liReadings,required  List<PaymentModel> liPayment,required List<dynamic>liAllData })
{
if (from.isNotEmpty && to.isNotEmpty) {
  DateTime fromdata=DateTime.parse(from);
  DateTime todata=DateTime.parse(to);
  int check=todata.compareTo(fromdata);
  if (todata.isAfter(fromdata) || check==0) {
  if(typeReport=='القراءات')
  {
    emit(ReportReading());
    return MyDate().getRangByDate(
        from: fromdata,
        to: todata,
        data:  liReadings );
  }
  else if(typeReport=='المدفوعات')
  {
    emit(ReportPayment());
    return MyDate().getRangByDate(
        from: fromdata,
        to: todata,
        data:  liPayment );
  }
  else 
  {
    emit(ReportReadingAndPayment());
     return MyDate().getRangByDate(
        from: fromdata,
        to: todata,
        data:  liAllData );
  }
}
else
{
  emit(ReportWrongDate());
  return [];
}
}
else{
  emit(ReportNoDateChooes());
   return [];
}
}



bool  checkData({ required String typeReport,
  required dynamic liReading,required dynamic liPayment })

{
  
 if(typeReport=='القراءات' &&liReading.isEmpty){


  emit(ReportNoDataReading());
    return false;

 }else if(typeReport=='المدفوعات'&& liPayment.isEmpty){


  emit(ReportNoDataPayment());
  return false;

 }



  return true;

}


                   

}

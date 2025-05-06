import 'package:bloc/bloc.dart';
import 'package:customer/helper/my_api.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/get_all_payments.dart';
import '../../controllers/get_all_readings.dart';
import '../../models/my_payment.dart';
import '../../models/my_reading.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  String? customerName;
   int indextofReading = 0;
   String? many;
   List<PaymentModel> liPayment = [];
  int? customerID;

  String? electronicMeterID;
  List<ReadingsModel> liReading = [];



  void getDataForHomePage()
 async {
  emit(HomeLoading());
 bool checkInternet = await Api().checkInternet();
 if(checkInternet)
 {
getData();
 }
 else
 {
  emit(HomeNoInternt());
 }
  }

  void getData()
 async {
     try{
     SharedPreferences share = await SharedPreferences.getInstance();
    electronicMeterID = share.getInt('ElectronicMeterID').toString();
     int customerID = share.getInt('customerID') ?? 0;
      liPayment = await GetAllPayments().getPayments(customerID: customerID);
     liReading = await GetAllReadings()
        .getReading(electronicMeterID: electronicMeterID.toString());
        indextofReading = liReading.length - 1;
        if(liReading.isNotEmpty)
        {
          emit(HomeSuccess());
        }
        else
        {
          emit(HomeNoData());
        }
  }catch (e)
  {
    emit(HomeFaluir(errMessage: e.toString()));
  }
  }




//   Future getPaymentAndCheckEnternt()
//  async {
//     bool checkInternet=await Api().checkInternet();
//     if(checkInternet)
//     {
//               SharedPreferences share = await SharedPreferences.getInstance();
   
     
//     }else
//     {
      
//     }
//   }
}

import 'package:bloc/bloc.dart';
import 'package:customer/cubit/home_cubit/home_cubit.dart';
import 'package:customer/helper/my_api.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:customer/controllers/add_new_austomer_movement.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());



  void paymanets({required String code , required String many,required allMayn, required double customerTotalDues})
  async {
    emit(PaymentLoading());
    bool checkEnternt=await Api().checkInternet();
    if(checkEnternt)
    {
        doPayment(code: code, many: many, allMayn: allMayn,customerTotalDues: customerTotalDues);
    }
    else 
    {
      emit(PaymentNoInernt());
    }
  }
  void doPayment({required String code , required String many,required String  allMayn, required double customerTotalDues})
 async {
      if(code =='1111')
      {
        try{
        
          int manyAferConversion;
       
                manyAferConversion =(double.parse(allMayn)-double.parse(many)).toInt();
         
          
         
           bool check=await AddNewAustomerMovement().addNewCustomerMovment(many: many, manyAfterpay: manyAferConversion);
           if(check)
           {
           
            emit(PaymentSuccessfully());
           }
           else 
           {
            emit(PaymentNoRowEffect());
           }

        }catch(e)
        {
          emit(PaymentFaulier(errMessage: e.toString()));

        }
      }
      else 
      {
        emit(PaymentWrongCode());
      }

   
  }

}

import 'package:customer/helper/API.dart';
import 'package:customer/helper/Constans.dart';
import 'package:customer/models/Payment.dart';

class GetAllPayments
{
  Future<List<PaymentModel>> GetPayments({required int CustomerID})
 async {
   List<dynamic> data =await Api().post(Url: "${UrlAll}GetAllPayments.php", body: {
      'CustomerID':CustomerID.toString()
    });
   List<PaymentModel> payments=[];
    for(int i=1;i<data.length;i++)
      {
        payments.add(PaymentModel.fromJson(data[i]));
      }

    return payments;
  }
}
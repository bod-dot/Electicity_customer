



import '../helper/my_api.dart';
import '../helper/my_constans.dart';
import '../models/my_payment.dart';

class GetAllPayments
{
  Future<List<PaymentModel>> getPayments({required int customerID})
 async {
   List<dynamic> data =await Api().post(url: "${urlAll}GetAllPayments.php", body: {
      'CustomerID':customerID.toString()
    });
   List<PaymentModel> payments=[];
    for(int i=1;i<data.length;i++)
      {
        payments.add(PaymentModel.fromJson(data[i]));
      }

    return payments;
  }
}
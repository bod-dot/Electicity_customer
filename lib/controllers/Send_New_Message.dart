import 'package:customer/helper/API.dart';
import 'package:customer/helper/Constans.dart';

class SendNewMessage {
  Future<void> sendMessage(
      {required String message, required int customerID}) async {


    dynamic data = await Api().post(Url: "${UrlAll}insertMessage.php", body: {
      'message':message,
      'customerID':customerID.toString(),

    });


    if(data=='Seccess')
      {

        print("done");
      }else
        {

        }
    
  }
}

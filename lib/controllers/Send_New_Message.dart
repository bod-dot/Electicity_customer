
import 'package:customer/helper/my_constans.dart';

import '../helper/my_api.dart';

class SendNewMessage {
  Future<void> sendMessage(
      {required String message, required int customerID}) async {

          bool checkInternet =await Api().checkInternet();

    if (checkInternet) {
  dynamic data = await Api().post(url: "${urlAll}insertMessage.php", body: {
    'message':message,
    'customerID':customerID.toString(),
  
  });
  
  
  if(data=='Seccess')
    {
  
    }
}
    
  }
}





import 'dart:async';

import 'package:customer/helper/my_constans.dart';


import '../helper/my_api.dart';
import '../models/meeage_model.dart';
class GetMessages {
  final StreamController<List<MessageModel>> streamController =
  StreamController<List<MessageModel>>.broadcast();

  Future<List<dynamic>> getMessage({required int customerID}) async {

      
        List<MessageModel> messages = [];

   bool checkInternet =await Api().checkInternet();

  if (checkInternet) {
  List<dynamic> data = await Api().post(
    url: "${urlAll}Get_All_Message.php",
    body: {
      'customerID': customerID.toString(),
    },
  );
   if(data.isEmpty)
   {
      data.add(MessageModel(message: "", customerID: customerID, empID:0 ));
   }
  
  for (int i = 1; i < data.length ; i++) {
    messages.add(MessageModel.fromjosn(data[i]));
  }
 if (!streamController.isClosed) {
  streamController.add(messages);
}
}



    return messages;
  }

  void dispose() {
    streamController.close();
  }
}
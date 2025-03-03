import 'dart:async';

import 'package:customer/helper/API.dart';
import 'package:customer/helper/Constans.dart';
import 'package:customer/models/MeeageModel.dart';
class GetMessages {
  final StreamController<List<MessageModel>> streamController =
  StreamController<List<MessageModel>>.broadcast();

  Future<List<dynamic>> getMessage({required int customerID}) async {

    List<dynamic> data = await Api().post(
      Url: "${UrlAll}Get_All_Message.php",
      body: {
        'customerID': customerID.toString(),
      },
    );

    List<MessageModel> messages = [];
    for (int i = 1; i < data.length ; i++) {
      messages.add(MessageModel.fromjosn(data[i]));
    }
    streamController.add(messages);


    return messages;
  }

  void dispose() {
    streamController.close();
  }
}
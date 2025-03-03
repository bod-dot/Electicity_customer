

import 'package:customer/helper/API.dart';
import 'package:customer/helper/Constans.dart';
import 'package:customer/models/Reading.dart';


class GetAllReadings {
  Future<List<ReadingsModel>> getReading({required String ElectronicMeterID}) async {
   List<dynamic> data = await Api().post(
        Url: '${UrlAll}GetReadings.php',
        body: {'ElectronicMeterID': ElectronicMeterID});
    List<ReadingsModel> read = [];

    for (int i = 1; i < data.length; i++) {

      read.add(ReadingsModel.fromJson(data[i]));
    }
    return read;
  }
}

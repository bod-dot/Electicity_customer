 


import '../helper/my_api.dart';
import '../helper/my_constans.dart';
import '../models/my_reading.dart';


class GetAllReadings {
  Future<List<ReadingsModel>> getReading({required String electronicMeterID}) async {
   List<dynamic> data = await Api().post(
        url: '${urlAll}GetReadings.php',
        body: {'ElectronicMeterID': electronicMeterID});
    List<ReadingsModel> readings = [];

    for (int i = 1; i < data.length; i++) {

      readings.add(ReadingsModel.fromJson(data[i]));
    }
    return readings;
  }
}

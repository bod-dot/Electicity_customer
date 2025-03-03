class ReadingsModel {
  final double PreviousReading;
  final double CurrentReading;
  final DateTime Date;
  final double TotalDuesInThisReading;
  final double CustomerTotalDues;
  final int PriceOfKilo;
  final int ReadingID;

  ReadingsModel( 
      
      {
        required this.TotalDuesInThisReading,
        required this.PreviousReading,
      required this.CurrentReading,
      required this.Date,
      required this.CustomerTotalDues,
      required this.PriceOfKilo,
      required this.ReadingID});

  factory ReadingsModel.fromJson(Map<String,dynamic>jsonData) {
    return ReadingsModel(
      TotalDuesInThisReading:double.parse(jsonData['TotalDuesInThisReading']) ,
        PreviousReading: double.parse(jsonData['PreviousReading']),
        CurrentReading: double.parse(jsonData['CurrentReading']),
        Date:
            DateTime.parse(jsonData['DateOfCurrentReading']['date']),
        CustomerTotalDues: double.parse(jsonData['CustomerTotalDues']),
        PriceOfKilo: int.parse(jsonData['PriceOfKilo']),
    ReadingID: jsonData['ReadingID']);
  }

  double GetUsageKilo() {
    return CurrentReading - PreviousReading;
  }

  double GetTotalBill() {
    return GetUsageKilo() * PriceOfKilo + TotalDuesInThisReading;
  }


  static double GetMaxUsage({required List<double> read}) {
    double max = 0;
    for (int i = 0; i < read.length; i++) {
     if(max<read[i])
       {
         max=read[i];
       }
    }
    return max + 100;
  }

static  List<double> GetUsageMonth({required List<ReadingsModel> readings, int valueMoth=11}) {


  List<double> LiValueMoth = List.filled(valueMoth, 0);

    for (int i = 0; i < readings.length; i++) {

      if (DateTime.now().year == readings[i].Date.year) {
        switch (readings[i].Date.month) {
          case 1:
            {
              LiValueMoth[0] = LiValueMoth[0] + readings[i].GetUsageKilo();
              break;
            }
          case 2:
            {
              LiValueMoth[1] = LiValueMoth[1] + readings[i].GetUsageKilo();
              break;
            }
          case 3:
            {
              LiValueMoth[2] = LiValueMoth[2] + readings[i].GetUsageKilo();
              break;
            }
          case 4:
            {
              LiValueMoth[3] = LiValueMoth[3] + readings[i].GetUsageKilo();
              break;
            }
          case 5:
            {
              LiValueMoth[4] = LiValueMoth[4] + readings[i].GetUsageKilo();
              break;
            }
          case 6:
            {
              LiValueMoth[5] = LiValueMoth[5] + readings[i].GetUsageKilo();
              break;
            }
          case 7:
            {
              LiValueMoth[6] = LiValueMoth[6] + readings[i].GetUsageKilo();
              break;
            }
          case 8:
            {
              LiValueMoth[7] = LiValueMoth[7] + readings[i].GetUsageKilo();
              break;
            }
          case 9:
            {
              LiValueMoth[8] = LiValueMoth[8] + readings[i].GetUsageKilo();
              break;
            }
          case 10:
            {
              LiValueMoth[9] = LiValueMoth[9] + readings[i].GetUsageKilo();
              break;
            }
          case 11:
            {
              LiValueMoth[10] = LiValueMoth[10] + readings[i].GetUsageKilo();
              break;
            }
          case 12:
            {
              LiValueMoth[11] = LiValueMoth[11] + readings[i].GetUsageKilo();
              break;
            }
        }
      }
    }

    return LiValueMoth;
  }
}

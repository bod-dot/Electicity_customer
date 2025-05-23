class ReadingsModel {
  final int previousReading;
  final int currentReading;
  final  DateTime date;
  final double totalDuesInThisReading;
  final double customerTotalDues;
  final double priceOfKilo;
  final int readingID;

  ReadingsModel(    
     {
        required this.totalDuesInThisReading,
        required this.previousReading,
      required this.currentReading,
      required this.date,
      required this.customerTotalDues,
      required this.priceOfKilo,
      required this.readingID});

  factory ReadingsModel.fromJson(Map<String,dynamic>jsonData) {
    return ReadingsModel(
      totalDuesInThisReading:double.parse(jsonData['TotalDuesInThisReading']) ,
        previousReading: jsonData['PreviousReading']??0,
        currentReading: jsonData['CurrentReading']??0,
        date:jsonData['DateOfCurrentReading']['date'] !=null ?
            DateTime.parse(jsonData['DateOfCurrentReading']['date']):DateTime.now(),
        customerTotalDues: double.parse(jsonData['CustomerTotalDues']),
        priceOfKilo: double.parse(jsonData['PriceOfKilo']),
    readingID: jsonData['ReadingID']);
  }

  int getUsageKilo() {
    return currentReading - previousReading;
  }

  double getTotalBill({ bool isListOne = false}) {

    return getUsageKilo() * priceOfKilo + totalDuesInThisReading;
  }


  static double getMaxUsage({required List<double> read}) {
    double max = 0;
    int test=0;
    for (int i = 0; i < read.length; i++) {
     if(max<read[i])
       {
         max=read[i];
       }
    }

   
    for(int i=0; i<max.toInt();)
    {
      if(i<max.toInt())
      {
        i+=50;
      }
     test= i-max.toInt();
    }
    return max + test;
  }

static  List<double> getUsageMonth({required List<ReadingsModel> readings}) {


int currentMonth = DateTime.now().month;
List<double> liValueMoth = List.filled(currentMonth, 0.0);


    for (int i = 0; i < readings.length; i++) {

      if (DateTime.now().year == readings[i].date.year) {
        switch (readings[i].date.month) {
          case 1:
            {
              liValueMoth[0] = liValueMoth[0] + readings[i].getUsageKilo();
              break;
            }
          case 2:
            {
              liValueMoth[1] = liValueMoth[1] + readings[i].getUsageKilo();
              break;
            }
          case 3:
            {
              liValueMoth[2] = liValueMoth[2] + readings[i].getUsageKilo();
              break;
            }
          case 4:
            {
              liValueMoth[3] = liValueMoth[3] + readings[i].getUsageKilo();
              break;
            }
          case 5:
            {
              liValueMoth[4] = liValueMoth[4] + readings[i].getUsageKilo();
              break;
            }
          case 6:
            {
              liValueMoth[5] = liValueMoth[5] + readings[i].getUsageKilo();
              break;
            }
          case 7:
            {
              liValueMoth[6] = liValueMoth[6] + readings[i].getUsageKilo();
              break;
            }
          case 8:
            {
              liValueMoth[7] = liValueMoth[7] + readings[i].getUsageKilo();
              break;
            }
          case 9:
            {
              liValueMoth[8] = liValueMoth[8] + readings[i].getUsageKilo();
              break;
            }
          case 10:
            {
              liValueMoth[9] = liValueMoth[9] + readings[i].getUsageKilo();
              break;
            }
          case 11:
            {
              liValueMoth[10] = liValueMoth[10] + readings[i].getUsageKilo();
              break;
            }
          case 12:
            {
              liValueMoth[11] = liValueMoth[11] + readings[i].getUsageKilo();
              break;
            }
        }
      }
    }

    return liValueMoth;
  }
}

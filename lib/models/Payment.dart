class PaymentModel {
  final int CustomerMovementID;
  final DateTime Date;
  final double CustomerMovementPaiedAmount;
  final int CustomerMovementType;
  final double TotalDuesAfterPaying;
  final String CustomerMovementNote;

  PaymentModel({required this.CustomerMovementID,
    required this.Date,
    required this.CustomerMovementPaiedAmount,
    required this.CustomerMovementType,
    required this.TotalDuesAfterPaying,
  required this.CustomerMovementNote});

  factory PaymentModel.fromJson(Map<String, dynamic>jsonData)
  {
    return PaymentModel(CustomerMovementID: jsonData['CustomerMovementID'],
        Date: DateTime.parse(jsonData['CustomerMovementDate']['date']),
        CustomerMovementPaiedAmount: double.parse(jsonData['CustomerMovementPaiedAmount']),
        CustomerMovementType: jsonData['CustomerMovementType'],
        TotalDuesAfterPaying: double.parse(jsonData['TotalDuesAfterPaying'],),
    CustomerMovementNote: jsonData['CustomerMovementNote']);
  }



}


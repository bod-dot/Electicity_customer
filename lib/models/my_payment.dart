class PaymentModel {
  final int customerMovementID;
  final DateTime date;
  final double customerMovementPaiedAmount;
  final int customerMovementType;
  final double totalDuesAfterPaying;
  final String customerMovementNote;

  PaymentModel({required this.customerMovementID,
    required this.date,
    required this.customerMovementPaiedAmount,
    required this.customerMovementType,
    required this.totalDuesAfterPaying,
  required this.customerMovementNote});

  factory PaymentModel.fromJson(Map<String, dynamic>jsonData)
  {
    return PaymentModel(customerMovementID: jsonData['CustomerMovementID']??0,
        date: DateTime.parse(jsonData['CustomerMovementDate']['date']),
        customerMovementPaiedAmount: double.parse(jsonData['CustomerMovementPaiedAmount']),
        customerMovementType: jsonData['CustomerMovementType'],
        totalDuesAfterPaying: double.parse(jsonData['TotalDuesAfterPaying'],),
    customerMovementNote: jsonData['CustomerMovementNote']);
  }



}


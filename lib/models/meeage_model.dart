class MessageModel {
  final String message;
  final int customerID;
  final int empID;

  MessageModel(
      {required this.message, required this.customerID, required this.empID});

  factory MessageModel.fromjosn(jsondata) {
    return MessageModel(
        message: jsondata['ComplaintText'],
        customerID: jsondata['CustomerID'],
        empID: jsondata['EmployeeID'] ?? 0);
  }
}

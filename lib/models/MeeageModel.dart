class MessageModel {
  final String Message;
  final int CustomerID;
  final int EmpID;

  MessageModel(
      {required this.Message, required this.CustomerID, required this.EmpID});

  factory MessageModel.fromjosn(jsondata) {
    return MessageModel(
        Message: jsondata['ComplaintText'],
        CustomerID: jsondata['CustomerID'],
        EmpID: jsondata['EmployeeID'] ?? 0);
  }
}

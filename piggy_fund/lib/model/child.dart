import 'transaction.dart';
class Child {
  int childId;
  String firstName;
  String lastName;
  double balance;
  double interestRate;
  double allowanceAmt;
  DateTime startDate;
  int compoundRate; //in days
  int allowanceRate; //in days
  List<Transaction> transactions;

  Child(this.childId, this.firstName, this.lastName, this.balance, this.interestRate, this.allowanceAmt, this.startDate, this.compoundRate, this.allowanceRate, this.transactions);

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      json['childId'],
      json['firstName'],
      json['lastName'],
      json['balance'],
      json['interestRate'],
      json['allowanceAmt'],
      json['startDate'],
      json['compoundRate'],
      json['allowanceRate'],
      json['transactions']
    );
  }
}

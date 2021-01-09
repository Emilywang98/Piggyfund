class Child {
  final int childId;
  final String firstName;
  final String lastName;
  final double balance;
  final double interestRate;
  final double allowanceAmt;
  final DateTime startDate;
  final int compoundRate; //in days
  final int allowanceRate; //in days

  Child(this.childId, this.firstName, this.lastName, this.balance, this.interestRate, this.allowanceAmt, this.startDate, this.compoundRate, this.allowanceRate);

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
    );
  }
}

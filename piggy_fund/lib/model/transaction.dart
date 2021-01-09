enum transactionType{
  allowance,
  withdrawal
}

class Transaction {
  final int transactionId;
  final int childId;
  final DateTime date;
  final double newBalanceAmt;
  final double transactionAmt;
  final transactionType type;

  Transaction(this.transactionId, this.childId, this.date, this.newBalanceAmt, this.transactionAmt, this.type);

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      json['transactionId'],
      json['childId'],
      json['date'],
      json['newBalanceAmt'],
      json['transactionAmt'],
      json['type'],
    );
  }
}

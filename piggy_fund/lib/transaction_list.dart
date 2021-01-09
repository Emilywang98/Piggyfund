import 'package:flutter/material.dart';
import 'package:piggy_fund/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> items;
  TransactionList({Key key, this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(2),
          height: 140,
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("${items[index].transactionAmt.toStringAsFixed(2)}"),
                Text("${items[index].type.toString()}"),
                // Text("${items[index].date.toString()}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
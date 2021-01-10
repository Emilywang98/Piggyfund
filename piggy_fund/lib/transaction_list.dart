import 'package:flutter/material.dart';
import 'package:piggy_fund/model/transaction.dart';

const oxfordBlue = const Color(0xFF040027);
const mikadoYellow = const Color(0xffffc600);
const pictorialCarmine = const Color(0xFFca054d);
const mediumPurple = const Color(0xFF5005CA);

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
            color: Color(0xff27b6fc),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("\$ ${items[index].transactionAmt.toStringAsFixed(2)}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(items[index].type==transactionType.withdrawal?"Withdrawal":"Allowance"),
                Text("${items[index].date.year.toString() } - ${items[index].date.month.toString()} - ${items[index].date.day.toString()}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
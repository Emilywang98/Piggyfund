import 'package:flutter/material.dart';
import 'model/transaction.dart';
import 'model/child.dart';

class NewTransaction extends StatefulWidget{
  Child item;
  String transactionAmt;
  NewTransaction({Key key, this.item}) : super(key: key);
  @override
  _NewTransaction createState() => _NewTransaction();
}

class _NewTransaction extends State<NewTransaction>{
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("New Transaction"),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.save),
              onPressed: ()=>{_sendTransactionBack(context)}
          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            leading: const Icon(Icons.person),
            title: new TextField(
              onChanged: (newText){
                widget.transactionAmt = newText;
              },
              decoration: new InputDecoration(
                hintText: "Withdrawal Amount",
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendTransactionBack(BuildContext context){
    double amt = double.parse(widget.transactionAmt);
    widget.item.balance -= amt;

    Transaction newTransaction = Transaction(0, 0, new DateTime.now(), widget.item.balance, amt, transactionType.withdrawal);
    widget.item.transactions.add(newTransaction);

    Navigator.pop(context, widget.item);
  }
}
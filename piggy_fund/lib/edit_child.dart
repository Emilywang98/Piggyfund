import 'package:flutter/material.dart';
import 'model/transaction.dart';
import 'model/child.dart';

class EditChild extends StatefulWidget{
  Child item;
  String interestAmt;
  String allowanceAmt;
  EditChild({Key key, this.item}) : super(key: key);
  @override
  _EditChild createState() => _EditChild();
}

class _EditChild extends State<EditChild>{
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Edit Child"),
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
                widget.interestAmt = newText;
              },
              decoration: new InputDecoration(
                hintText: "Interest Rate",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.person),
            title: new TextField(
              onChanged: (newText){
                widget.allowanceAmt = newText;
              },
              decoration: new InputDecoration(
                hintText: "Weekly Allowance",
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendTransactionBack(BuildContext context){
    double i_amt = double.parse(widget.interestAmt);
    double a_amt = double.parse(widget.allowanceAmt);
    widget.item.interestRate = i_amt;
    widget.item.allowanceAmt = a_amt;

    Navigator.pop(context, widget.item);
  }
}
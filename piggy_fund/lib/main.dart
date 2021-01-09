import 'package:flutter/material.dart';
import 'package:piggy_fund/parent_child_details.dart';
import 'package:piggy_fund/model/child.dart';
import './parentsum.dart';

Child c1 = Child(0, "Carl", "Wang", 200.00, 0.05, 15.00, new DateTime.utc(2020, 1, 1), 60, 14);
main() {
  runApp(MaterialApp(
    title: 'PiggyFund',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary Page'),
      ),
      body: Column(
        children: <Widget>[
        //   ElevatedButton(
        //   child: Text('Edit'),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => ChildDetails(item: c1,)),
        //     );
        //   },
        // ),
        ParentSum('Child'),
      ]),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Child"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Save'),
        ),
      ),
    );
  }
}
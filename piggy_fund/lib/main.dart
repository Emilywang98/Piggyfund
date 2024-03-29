import 'package:flutter/material.dart';
import 'package:piggy_fund/model/child.dart';
import './parentsum.dart';
import './new_child.dart';
import 'dart:async';
import './parent_child_details.dart';
import './model/child.dart';
import 'model/transaction.dart';
import 'child_summary.dart';

Transaction t1 = Transaction(0, 0, new DateTime.utc(2020, 1, 1), 230.00, 15.00, transactionType.allowance);
Transaction t2 = Transaction(0, 0, new DateTime.utc(2020, 1, 1), 215.00, 15.00, transactionType.withdrawal);
List<Transaction> transactionList = [t1, t2];

Child c1 = Child(0, "Jane", "Wang", 200.00, 10, 50.00,
    new DateTime.utc(2020, 1, 1), 60, 14, transactionList);

class Terminal {
  final String id;
  final String source;
  final int newstories;

  Terminal({
    this.id,
    this.source,
    this.newstories,
  });
}

class UserInput extends StatefulWidget {
  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  String idInput;
  String sourceInput;
  int newstoriesInput;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: oxfordBlue,
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (val) {
                // (val) is looking at the value in the textbox.
                idInput = val;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Interest Rate',
              ),
              onChanged: (val) {
                sourceInput = val;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Weekly Allowance',
              ),
              onChanged: (val) {
                newstoriesInput = int.parse(val);
              },
            ),
            FlatButton(
              child: Text('submit'),
              onPressed: () {
                events.add(Terminal(
                    id: idInput,
                    source: sourceInput,
                    newstories: newstoriesInput));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyTerminal extends StatefulWidget {
  @override
  _MyTerminalState createState() => _MyTerminalState();
}

StreamController<Terminal> events = StreamController<Terminal>();

class _MyTerminalState extends State<MyTerminal> {
  List<Terminal> terminalNodes = [];

  @override
  initState() {
    events.stream.listen((data) {
      terminalNodes.add(data);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: terminalNodes.map((node) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChildDetails(item: c1)),
                  );
                },
                child: Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: oxfordBlue,
                      child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                            Container(
                                child: Text(node.id,
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold))),

                            Text(node
                                .source), //how do i do a space between interest rate and allowance?
                            Text(node.newstories.toString())
                    ]))));
          }).toList(),
        ),
      ),
    );
  }
}


const oxfordBlue = const Color(0xFF040027);
const mikadoYellow = const Color(0xffffc600);
const pictorialCarmine = const Color(0xFFca054d);
const mediumPurple = const Color(0xFF5005CA);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: oxfordBlue,
          accentColor: pictorialCarmine,

          canvasColor: oxfordBlue,

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
          headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 14.0, color: mikadoYellow),
          headline3: TextStyle(fontSize: 14.0, color: Colors.white),
          headline4: TextStyle(fontSize: 32.0, color: Colors.white, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: MyHomePage(title: 'Parent Summary Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text('Name',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.blue[700])),
                ),
                Expanded(
                  child: Text('Interest rate (%)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.blue[700])),
                ),
                Expanded(
                  child: Text('Weekly Allowance',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.blue[700])),
                ),
              ],
            ),
            Divider(color: Colors.black),
            Expanded(flex: 2, child: MyTerminal()),
            Expanded(flex: 2, child: UserInput()),
            Expanded(
                flex: 1,
                child: GestureDetector(
                    child: Image.asset("assets/pig.jpeg"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChildSummary(item: c1)),
                      );
                    },
                )
            ),
          ])));
//extends inherits from another class
//method called build - draw a widget using the build function
//takes one argument called context, thing returned on the screen
//   build(context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Parent Portal'),
//         ),
//         body: ParentSum('Child'),
//       );
//       ),
//     );
//   }
}}

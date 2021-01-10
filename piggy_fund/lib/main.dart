import 'package:flutter/material.dart';
import './parentsum.dart';
import './new_child.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import './parent_child_details.dart';
import './model/child.dart';

Child c1 = Child(0, "Carl", "Wang", 200.00, 0.05, 15.00,
    new DateTime.utc(2020, 1, 1), 60, 14);

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
                    ])));
          }).toList(),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 1, child: MyTerminal()),
            Expanded(flex: 1, child: UserInput()),
          ],
        ),
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Edit'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
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

import 'package:flutter/material.dart';
import 'package:piggy_fund/model/child.dart';
import './parentsum.dart';
import './new_child.dart';
import './child_add.dart';

Child c1 = Child(0, "Carl", "Wang", 200.00, 0.05, 15.00, new DateTime.utc(2020, 1, 1), 60, 14);

const oxfordBlue = const Color(0xFF040027);
const mikadoYellow = const Color(0xffffc600);
const pictorialCarmine = const Color(0xFFca054d);
const mediumPurple = const Color(0xFF5005CA);

main() {
  runApp(MaterialApp(
    title: 'PiggyFund',
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
        headline4: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
//extends inherits from another class
//method called build - draw a widget using the build function
//takes one argument called context, thing returned on the screen
  build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Parent Portal'),
        ),
        body: ParentSum('Child'),
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

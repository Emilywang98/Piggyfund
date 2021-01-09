import 'package:flutter/material.dart';
import './parentsum.dart';

main() {
  runApp(MaterialApp(
    title: 'Edit',
    home: FirstRoute(),
  ));

  runApp(MyApp());
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
        body: ParentSum('Name'),
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

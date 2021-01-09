import 'package:flutter/material.dart';
import './child_add.dart';

class AddChild extends StatefulWidget {
  final String childAddition;

  ParentSum(this.childAddition);
  @override
  State<StatefulWidget> createState() {
    //TODO: implement createState
    return MyCustomForm();
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next step.
  }
}
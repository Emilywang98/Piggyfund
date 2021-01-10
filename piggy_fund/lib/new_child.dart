import 'package:flutter/material.dart';
import './child_add.dart';
import './parentsum.dart';

/*class AddChild extends StatefulWidget {
  String childAddition;

  ParentSum(this.childAddition);
  @override
  State<StatefulWidget> createState() {
    //TODO: implement createState
    return MyCustomForm();
  }
}*/

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
  void initState() {
    super.initState();

    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Another Child'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              controller: myController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    const Radius.circular(12.0),
                  ),
                ),
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.black.withOpacity(0.8)),
              ),
            ),
            TextField(
              controller: myController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    const Radius.circular(12.0),
                  ),
                ),
                labelText: 'Weekly Allowance',
                labelStyle: TextStyle(color: Colors.black.withOpacity(0.8)),
              ),
            ),
            TextField(
              controller: myController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    const Radius.circular(12.0),
                  ),
                ),
                labelText: 'Interest Rate',
                labelStyle: TextStyle(color: Colors.black.withOpacity(0.8)),
              ),
            ),
            RaisedButton(
              onPressed: () => submit(),
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void submit() {
    Navigator.of(context).pop(myController.text);
  }
}

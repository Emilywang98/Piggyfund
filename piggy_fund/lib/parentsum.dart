import 'package:flutter/material.dart';
import './child_add.dart';
import './new_child.dart';

class ParentSum extends StatefulWidget {
  final String startingProduct;

  ParentSum(this.startingProduct);
  @override
  State<StatefulWidget> createState() {
    //TODO: implement createState
    return _ParentManager();
  }
}

//keyword provided by the State class

class _ParentManager extends State<ParentSum> {
  List<String> _products = []; //list is an array of string ty[e]

  @override
  void initState() {
    _products.add(widget.startingProduct);
    super
        .initState(); //overrides built in method but super. always refers to base class you're extending.
//super makes it so it's called there even if you're overriding it.
  }

  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(
              8.0), //8.0 is a float that represents space in all directions around button
          child: RaisedButton(
              child: Text('Add another child'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyCustomForm()),
                );
              } //the onpressed function directs the button!
              ),
        ),
        Products(_products)
      ],
    );
  }
}

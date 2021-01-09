import 'package:flutter/material.dart';
import './child_add.dart';

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
            onPressed: () {
              setState(() {
                //setState allows the re-rendering of the app
                _products.add(
                    'Child'); //this will bring another card with "advanced food tester
              });

              //change some data dynamically turned into card widgets
            }, //the onpressed function directs the button!
            child: Text('Add another child'),
          ),
        ),
        Products(_products)
      ],
    );
  }
}

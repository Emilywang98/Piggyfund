import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class Products extends StatelessWidget {
  //everything in this class is not changeable because its stateless
  final List<String>
      products; //final means the value of products will never change
  Products(
      this.products); //this. takes incoming argument and stores it in a property with the same name

  //get products into product widget aka constructor
  @override
  Widget build(BuildContext context) {
    return Column(
      children: products
          .map(
            (element) => Card(
              child: Column(
                children: <Widget>[
                  Text(element)
                ],
              ),
            ),
          )
          .toList(), //takes an updated list of cards and renders to screen
      //this tolist method is pointing to the cards
    );
  }
}

//Scaffold() home widget drawn on the screen when app loads
//MaterialApp widget wraps the entire app, adds navigator to switch between pages
//widget is a data type

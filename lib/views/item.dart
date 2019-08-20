import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second route"),),
      body: RaisedButton(
        onPressed:() {
           Navigator.pop(context);
        },
        child: Text("Go back"),
      ),
    );

  }
  
}
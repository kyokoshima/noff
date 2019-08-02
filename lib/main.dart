import 'package:flutter/material.dart';

void main() => runApp(Noff());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    final List<MaterialButton> buttons = ["A", "B", "C", "D", "E"].map(
      (f) => RaisedButton(child: Text(f), 
      elevation: 30,
      color: Colors.cyan, onPressed: (){},)).toList();

    return Scaffold(
        appBar: AppBar(title: Text('Text'),
        ),
        body: Container(
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: buttons
          )
        )
    );
  }
}
class Noff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

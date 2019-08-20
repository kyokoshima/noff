import 'package:flutter/material.dart';
import 'views/home.dart';
import 'compoinents/target_list_storage.dart';

void main() => runApp(Noff());

class Noff extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(storage: TargetListStorage()),
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
    );
  }
}

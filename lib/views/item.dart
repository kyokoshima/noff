import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home.dart';

class Item extends StatelessWidget {

  final HomeState parent;
  Item({Key key, @required this.parent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second route"),),
      body: RaisedButton(
        onPressed:() {
           Navigator.pop(context);
        },
        child: ItemForm(this.parent),
      ),
    );
  }
  
}

class ItemForm extends StatefulWidget {
  final HomeState parent;
  ItemForm(this.parent);
  @override
  State<StatefulWidget> createState() {
    return ItemFormState();
  }
}

class ItemFormState extends State<ItemForm> {
  String _name = "";
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
              controller: _nameController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {    
                    this.widget.parent.addList({"name": "bbbbb"});
                    Navigator.pop(context);
                  } 
                },
                child: Text('Submit'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100.0)
            ),
          ],
          )

    );
  }
  
}
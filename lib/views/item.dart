import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/block_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'home.dart';

@immutable
class Item extends StatelessWidget {
  const Item({Key key, @required this.parent}) : super(key: key);
  final HomeState parent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second route'),
      ),
      body: ItemForm(parent),
    );
  }
}

@immutable
class ItemForm extends StatefulWidget {
  const ItemForm(this.parent);
  final HomeState parent;
  @override
  State<StatefulWidget> createState() {
    return ItemFormState();
  }
}

class ItemFormState extends State<ItemForm> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color itemColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Center(
        child: Container(
            width: width / 3 * 2,
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _nameController,
                      ),
                    ),
                    Container(
                      // color: Colors.cyan,
                      child: BlockPicker(
                        onColorChanged: (Color value) {
                          setState(() {
                            itemColor = value;
                          });
                        },
                        pickerColor: itemColor,
                      ),
                      height: height / 2.0,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          widget.parent.addList({
                            'name': _nameController.text,
                            'color': itemColor
                          });
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ))));
  }
}

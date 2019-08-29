import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noff/model/item.dart';
import 'package:tinycolor/tinycolor.dart';
import 'package:uuid/uuid.dart';
import '../compoinents/target_list_storage.dart';
import 'detail.dart';

class Home extends StatefulWidget {
  const Home({Key key, @required this.storage}) : super(key: key);
  final TargetListStorage storage;

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final Map<String, Item> _list = {};
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    // widget.storage.readList().then((List<Map> list)
    //   {
    //     setState(() {
    //       _list = list;
    //     });
    //   }
    // );
    _list[Uuid().v1()] = Item(name: 'aaaa', color: Colors.red, on: true);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    super.dispose();
  }

  Map<String, dynamic> addList(Item item) {
    setState(() {
      _list[Uuid().v1()] = item;
    });
  }

  void removeItem(String key) {
    setState(() {
      _list.remove(key);
    });
  }

  void updateItem(String key, Item newItem) {
    setState(() {
      _list[key] = newItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final EdgeInsets padding = MediaQuery.of(context).padding;

    final AppBar appBar = AppBar(
      title: const Text('Text'),
    );
    final double height = size.height -
        padding.top -
        padding.bottom -
        appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final String itemKey = _list.keys.elementAt(index);
          final Item item = _list[itemKey];
          final String name = item.name;
          final Color color =
              item.on ? item.color : TinyColor(item.color).darken(30).color;
          return Card(
            color: color,
            child: Dismissible(
              key: Key(index.toString()),
              onDismissed: (direction) {
                setState(() {
                  removeItem(itemKey);
                });
              },
              child: InkWell(
                onTap: () {
                  setState(() {
                    final Item newItem =
                        Item(name: item.name, color: item.color, on: !item.on);
                    updateItem(itemKey, newItem);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                  child: Container(
                    height: height / 5,
                    child: Text(
                      '$name',
                      style: TextStyle(fontSize: 42.0),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: _list.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FAB press');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Detail(parent: this),
                maintainState: false,
                fullscreenDialog: true),
          );
          // Navigator.push(context,
          // CupertinoPageRoute(fullscreenDialog: true, builder: (context) => Item(parent: this)));
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noff/views/item.dart';
import 'package:uuid/uuid.dart';
import '../compoinents/target_list_storage.dart';

class Home extends StatefulWidget {
  const Home({Key key, @required this.storage}) : super(key: key);
  final TargetListStorage storage;

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final List<Map<String, dynamic>> _list = [];
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
    _list.add({'key': Uuid().v1(), 'name': 'aaaa', 'color': Colors.red});
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

  Map<String, dynamic> addList(Map<String, dynamic> item) {
    setState(() {
      _list.add(item);
    });
  }

  void removeItem(Map<String, dynamic> item) {
    setState(() {
      _list.remove(item);
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
          final Map<String, dynamic> item = _list[index];
          final String name = item['name'];
          final Color color = item['color'];
          return Card(
            color: color,
            child: Dismissible(
              key: Key(index.toString()),
              onDismissed: (direction) {
                setState(() {
                  removeItem(item);
                });
              },
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
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
                builder: (BuildContext context) => Item(parent: this),
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

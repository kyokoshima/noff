import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noff/views/item.dart';
import '../compoinents/target_list_storage.dart';

class Home extends StatefulWidget {
  final TargetListStorage storage;
 
  Home({Key key, @required this.storage}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  List<Map> _list = [];
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    // widget.storage.readList().then((List<Map> list)
    //   {
    //     setState(() {
    //       _list = list;
    //     });
    //   }
    // );
    _list.add({ "name" : "aaaa"});
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
  Map<String, String> addList(Map<String, String> item) {
    setState(() {_list.add(item); });
  }
  void removeItem(Map<String, String> item) {
    setState(() { _list.remove(item); });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var padding = MediaQuery.of(context).padding;
  
    AppBar appBar = AppBar(title: Text('Text'),);
    double height = size.height - padding.top - padding.bottom - appBar.preferredSize.height;
    
    return Scaffold(
      appBar: appBar,
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var name = _list[index]['name'];
          return Card(
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: Container(
                  height: height / 5,
                  child: Text('$name', style: TextStyle(fontSize: 42.0),),
                ),
              ),
            ),
          );
        },
        itemCount: _list.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FAB press");
          Navigator.push(context, MaterialPageRoute(builder: (context) => Item(parent: this)));
          // Navigator.push(context, 
          // CupertinoPageRoute(fullscreenDialog: true, builder: (context) => Item(parent: this)));
          
        },
      ),
    );
  }
}


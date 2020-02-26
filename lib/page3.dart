import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Page3State();
  }
}

class _Page3State extends State<Page3> {
  List dataFromNetwork = List();
  String appTitle = "Future Builder Demo";

  Future _doSthInNetwork() {
    return Future.delayed(Duration(seconds: 4)).then((_) {
      for (int i = 0; i < 100; i++) {
        dataFromNetwork.add({"title": "Bu bir title: $i", "subtitle": 100 - i});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        leading: Icon(Icons.history),
      ),
      body: FutureBuilder(
          future: _doSthInNetwork(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.active) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: dataFromNetwork.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  Map m = dataFromNetwork[index];
                  return ListTile(
                    leading: Icon(Icons.cake),
                    title: Text(m['title']),
                    subtitle: Text("${m['subtitle']} sadas sada"),
                  );
                });
          }),
    );
  }
}

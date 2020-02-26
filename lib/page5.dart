import 'package:flutter/material.dart';

class Page5 extends StatefulWidget {
  final String param;

  const Page5({Key key, this.param}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Page5State();
  }
}

class _Page5State extends State<Page5> {
  void sth(int a, int b, {String zzz, String yyy = "denemesel"}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App bar: " + widget.param),
      ),
      body: ListView(
        children: <Widget>[
          Center(child: Text("Merhaba Page 5")),
          RaisedButton(
            onPressed: () => print("heheh"),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[Icon(Icons.add), SizedBox(width: 10), Text("Tikla")],
            ),
          ),
          ListView(
            physics: PageScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                title: Text("Tile 1"),
              ),
              ListTile(
                title: Text("Tile 2"),
              ),
              ListTile(
                title: Text("Tile 3"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
              ListTile(
                title: Text("Tile 4"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

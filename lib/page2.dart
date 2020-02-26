import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Merhaba"),
      ),
      body: ListView(
        children: <Widget>[Text("Child item 1"), Text("Child item 2"), Text("Child item 3")],
      ),
    );
  }
}

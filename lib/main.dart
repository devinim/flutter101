import 'package:flutter/material.dart';
import 'package:fluuter101/page2.dart';
import 'package:fluuter101/page3.dart';
import 'package:fluuter101/page4.dart';
import 'package:fluuter101/page5.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Go to page 2"),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Page2())),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text("Go to page 3"),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Page3())).then((_) {
                _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Deneme 1234")));
              }),
            ),
            SizedBox(height: 20),
            RaisedButton(
                child: Text("Go to page 4"),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Page4()))),
            SizedBox(height: 20),
            RaisedButton(
              child: Text("Go to page 5"),
              onPressed: () =>
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Page5(param: "Bu bir pparam"))),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() async {
    setState(() => _isLoading = true);
    Future.delayed(Duration(seconds: 3)).then((_) {
      setState(() => _isLoading = false);
    });
  }

  List<Widget> _getItems() {
    List<Widget> lst = new List();
    if (_isLoading) {
      return lst;
    }
    for (int i = 0; i < 25; i++) {
      lst.add(ListTile(
        title: Text("Bu bir wiget $i"),
        leading: Icon(Icons.folder_open),
        trailing: Icon(Icons.arrow_forward),
      ));
    }

    return lst;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Merhaba"),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(24),
            children: <Widget>[
              ListTile(
                title: Text("Birazdan widget listesi gorecegiz"),
                leading: Icon(Icons.folder_open),
                trailing: Icon(Icons.arrow_forward),
              ),
            ]..addAll(_getItems()),
          ),
          _isLoading ? Center(child: CircularProgressIndicator()) : Container(),
        ],
      ),
    );
  }
}

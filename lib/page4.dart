import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluuter101/utl_http.dart';

class Page4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  Map<dynamic, dynamic> _data = Map();
  bool _isLoading = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    _data.clear();
    setState(() => _isLoading = true);
    HttpUtil hu = HttpUtil();
    print('here');
    hu.listSth().then((r) {
      print('here2');
      _data = r;
    }).catchError((e) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "Hata:" + e.toString(),
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }).whenComplete(() {
      setState(() => _isLoading = false);
    });
  }

  Widget _getBody() {
    if (_isLoading) {
      return Text("Bekleyin...");
    }

    return ListView.builder(
        itemCount: _data['result'] == null ? 0 : _data['result'].length,
        itemBuilder: (BuildContext context, index) {
          Map row = _data['result'][index];
          return ListTile(
            leading: row['gender'] == 'female' ? Icon(Icons.pregnant_woman) : Icon(Icons.person),
            title: Text(row['first_name'] + " " + row['last_name']),
            subtitle: Text(row['email']),
            trailing: row['status'] == 'active'
                ? Icon(Icons.check_circle_outline, color: Colors.lightGreen)
                : Icon(Icons.remove_circle_outline, color: Colors.red),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Cupertino Page 4"),
        ),
        body: Stack(
          children: <Widget>[
            _getBody(),
            _isLoading ? Center(child: CircularProgressIndicator()) : Container(),
          ],
        ));
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DbTestScreen extends StatefulWidget {
  const DbTestScreen({Key? key}) : super(key: key);

  @override
  _DbTextScreenState createState() => _DbTextScreenState();
}

class _DbTextScreenState extends State<DbTestScreen> {
  StreamController<List> _streamController = StreamController<List>();
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:  StreamBuilder<List>(
        stream: _streamController.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData)
            return ListView(
              children: [
                for (Map document in snapshot.data)
                  Text(document['NAME'])
              ],
            );
          return Text('Loading...');
        },
      )
    );
  }

  @override
  Future getData() async{
    var url = Uri.http('182.217.140.11:3000', '/api/md/getMdList');
    http.Response response = await http.get(url);
    var data = json.decode(response.body);
    print(data.toString());
    _streamController.add(data);
  }

  @override
  void initState() {
    getData();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) => getData());
    super.initState();
  }
}

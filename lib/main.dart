import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart';
import 'data_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _dataService = DataService();
  // ignore: unused_field
  late String _response;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: Center(
        child: Builder(builder: (_) {
          // ignore: unnecessary_null_comparison
          if (_response != null) {
            return  ListView(children: [
              Text(_response)
            ],
           );
          }else{
          return ElevatedButton(
            child: Text("MakeRequest"),
            onPressed: _makeRequest,
          );}
      }),
      ),
    ));
  }

  void _makeRequest() async {
    final response = await _dataService.makeRequestToApi();
    setState(() => _response = response as String);
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

class DataService {
  Future makeRequestToApi() async {
    //https://jsonplaceholder.typicode.com/users
    final uri = Uri.https('jsonplaceholder.typicode.com', 'users');
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return json;
  }
}

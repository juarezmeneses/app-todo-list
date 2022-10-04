import 'dart:convert';

import 'package:http/http.dart' as http;

Future main() async {
  final json = await fetch();
  print(json['id']);
  print4();
  print('1');
  print('2');
  print('3');
}

Future<Map> fetch() async {
  var url = Uri.http('jsonplaceholder.typicode.com', '/todos/1');
  var response = await http.get(url);
  //print(response.body);
  var json = jsonDecode(response.body);
  return json;
}

Future<void> print4() async {
  await Future.delayed(Duration(seconds: 2));
  print('4');
}

import 'dart:convert';

import 'package:http/http.dart' as http;

Future main() async {
  print(stringToInt('d'));

  final todo = await fetch();
  print(todo.toJson());
  print4();
  print('1');
  print('2');
  print('3');
}

Future<Todo> fetch() async {
  var url = Uri.http('jsonplaceholder.typicode.com', '/todos/1');
  var response = await http.get(url);
  //print(response.body);
  var json = jsonDecode(response.body);
  var todo = Todo.fromJson(json);
  return todo;
}

Future<void> print4() async {
  await Future.delayed(Duration(seconds: 2));
  print('4');
}

class Todo {
  final String title;
  final int id;
  final int userId;
  final bool completed;

  Todo(
      {required this.title,
      required this.id,
      required this.userId,
      required this.completed});

  factory Todo.fromJson(Map json) {
    return Todo(
        id: json['id'],
        completed: json['completed'],
        userId: json['userId'],
        title: json['title']);
  }

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
      'userId': userId,
    };
  }
}

int stringToInt(String text) {
  int value;
  try {
    value = int.parse(text);
  } catch (e) {
    throw Exception('Input text ($text) is not a number');
  }

  return value;
}

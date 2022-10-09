import 'package:app_todo_list/src/models/todo_model.dart';
import 'package:dio/dio.dart';

class TodoRepository {
  final dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    List<TodoModel> todos = [];
    for (var json in list) {
      final todo = TodoModel.fromJson(json);
      todos.add(todo);
    }

    return todos;
  }
}

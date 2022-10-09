import 'package:app_todo_list/src/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = TodoRepository();

  test('It should bring a list of TodoModel', () async {
    final list = await repository.fetchTodos();
    print(list[0].title);
    expect(list[1].title, 'quis ut nam facilis et officia qui');
  });
}

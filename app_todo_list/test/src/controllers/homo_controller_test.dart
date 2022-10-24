import 'package:app_todo_list/src/controllers/home_controller.dart';
import 'package:app_todo_list/src/models/todo_model.dart';
import 'package:app_todo_list/src/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

mixin TodoRepositoryMock implements Mock, TodoRepositoryMock {}

void main() {
  final repository = TodoRepositoryMock();

  final controller = HomeController(repository);

  test('deve preencher variavel todos', () async {
    //when(repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);
    when(() => repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);

    await controller.start();
    expect(controller.todos.isNotEmpty, true);
  });
}

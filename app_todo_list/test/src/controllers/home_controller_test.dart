import 'package:app_todo_list/src/controllers/home_controller.dart';
import 'package:app_todo_list/src/models/todo_model.dart';
import 'package:app_todo_list/src/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:mockito/mockito.dart';
import 'package:mocktail/mocktail.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

void main() {
  final repository = TodoRepositoryMock();

  final controller = HomeController(repository);

  test('must fill variable todos', () async {
    //when(repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);
    when(() => repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.sucess);
    expect(controller.todos.isNotEmpty, true);
  });

  test('must change state to error if request fails', () async {
    //when(repository.fetchTodos()).thenThrow(Exception());
    when(() => repository.fetchTodos()).thenThrow(Exception());
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.error);
  });
}

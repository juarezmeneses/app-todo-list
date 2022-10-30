import 'package:app_todo_list/src/models/todo_model.dart';
import 'package:app_todo_list/src/repositories/todo_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<TodoModel> todos = [];

  final TodoRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);
  //HomeState state = HomeState.start;

  HomeController([TodoRepository? repository])
      : _repository = repository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _repository.fetchTodos();
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, sucess, error }

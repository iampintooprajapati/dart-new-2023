import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo_model.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    final todo = TodoModel(name: title, createdAt: DateTime.now());
    state.add(todo);
    emit([...state]);
  }
}

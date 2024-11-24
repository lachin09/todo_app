/*


TO DO CUBIT : a simples tate menegment

Each cubit is a list of todos */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/domain/models/todo.dart';
import 'package:to_do_app/domain/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  //reference todo repo
  final TodoRepo todoRepo;

  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }
  //LOAD
  Future<void> loadTodos() async {
    //fetch list of todos from repo
    final todoList = await todoRepo.getTodos();
    //emit the fetched list as a new state
    emit(todoList);
  }

// add
  Future<void> addTodo(String text) async {
    // create a new todo with unique id

    final newTodo = Todo(id: DateTime.now().millisecondsSinceEpoch, text: text);
    //save the new id to repo
    await todoRepo.addTodos(newTodo);
    // reload
    loadTodos();
  }

  // delete
  Future<void> deleteTodo(Todo todo) async {
    // delete the provided todo from repo
    await todoRepo.deleteTodo(todo);

    //re-load
    loadTodos();
  }

  //TOGGLE
  Future<void> toggleCompletion(Todo todo) async {
// toggle the completion status of provided todo

    final updateTodo = todo.toggleCompletion();
    //update the todo in repo with ne completion status
    await todoRepo.updateTodo(updateTodo);

    // re-load
    loadTodos();
  }
}

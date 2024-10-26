/*
TODO REPOSITORY

Here you define what the app can do
 */

import 'package:todo_app/domain/models/todo.dart';

abstract class TodoRepo {
  // get list of todo
  Future<List<Todo>> getTodos();

  //add an new todo
  Future<void> addTodos(Todo newTodo);

  // update an existing todo
  Future<void> updateTodo(Todo todo);

  //delete a todo
  Future<void> deleteTodo(Todo todo);
}


/*

NOTES:

-the repo in the domain layer outlines what operations the app can do,
but doesnt worry about the specific implementation  details. Thats for the data layer.


-technology agnostic: independent of any technology  or framework.
*/
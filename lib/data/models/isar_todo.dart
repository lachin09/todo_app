/*
ISAR TO DO MODEL

Convert todo model into isar todo model what we can store in our isar db



 */

import 'package:isar/isar.dart';
import 'package:todo_app/domain/models/todo.dart';
//to generete isar todo object, run:dart run build_runner build
part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isComplated;

  // convert isar object -> pure todo object to use in pur app

  Todo toDomain() {
    return Todo(id: id, text: text, isComplated: isComplated);
  }
  //convert pure todo object -> isar object to store in isar db.

  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isComplated = todo.isComplated;
  }
}

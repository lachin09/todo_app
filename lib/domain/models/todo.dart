/*
TO DO MODEL
This is what a todo object is
it has these properties 
-id 
-text
-isComplated

 */

class Todo {
  final int id;
  final String text;
  final bool isComplated;

  Todo({required this.id, required this.text, this.isComplated = false});

  Todo toggleCompletion() {
    return Todo(id: id, text: text, isComplated: !isComplated);
  }
}

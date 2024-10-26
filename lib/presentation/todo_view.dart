/*
TO DO VIEW :responsible for ui
-use BlocBuilder

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/models/todo.dart';
import 'package:todo_app/presentation/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});
  //show dialog  box for user to type
  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          //cancel button
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("cancel")),
          // add button
          TextButton(
              onPressed: () {
                todoCubit.addTodo(textController.text);
                Navigator.of(context).pop();
              },
              child: const Text("add"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _showAddTodoBox(context)),
      body: BlocBuilder<TodoCubit, List<Todo>>(builder: (context, todos) {
        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            // get individual todo from todo list
            final todo = todos[index];
            //listTile ui
            return ListTile(
              //text
              title: Text(todo.text),

              //checknBox

              leading: Checkbox(
                  value: todo.isComplated,
                  onChanged: (value) => todoCubit.toggleCompletion(todo)),
              // delete button
              trailing: IconButton(
                  onPressed: () => todoCubit.deleteTodo(todo),
                  icon: const Icon(Icons.cancel_outlined)),
            );
          },
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:what_to_do_app/model/todo.dart';
import 'package:what_to_do_app/widgets/todo/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.tasks, required this.onRemoveTask});

  final List<Todo> tasks;
  final void Function(Todo task) onRemoveTask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(
          tasks[index],
        ),
        onDismissed: (direction) {
          onRemoveTask(
            tasks[index],
          );
        },
        child: TodoItem(
          todo: tasks[index],
        ),
      ),
      itemCount: tasks.length,
    );
  }
}

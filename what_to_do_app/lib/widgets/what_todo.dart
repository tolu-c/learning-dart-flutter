import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_to_do_app/model/todo.dart';
import 'package:what_to_do_app/widgets/new_todo.dart';
import 'package:what_to_do_app/widgets/todo/todo_list.dart';

class WhatTodo extends StatefulWidget {
  const WhatTodo({super.key});

  @override
  State<WhatTodo> createState() => _WhatTodoState();
}

class _WhatTodoState extends State<WhatTodo> {
  final List<Todo> _todoItems = [];

  void _addTaskModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTodo(
        onAddTask: addTaskToList,
      ),
      isScrollControlled: true,
    );
  }

  void addTaskToList(Todo task) {
    setState(() {
      _todoItems.add(task);
    });
  }

  void removeTask(Todo task) {
    final taskIndex = _todoItems.indexOf(task);
    setState(() {
      _todoItems.remove(task);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Task Deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(
              () {
                _todoItems.insert(taskIndex, task);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text(
        "No Tasks found. Start adding some!",
        style: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.blue[900],
        ),
        textAlign: TextAlign.center,
      ),
    );

    if (_todoItems.isNotEmpty) {
      mainContent = TodoList(
        tasks: _todoItems,
        onRemoveTask: removeTask,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "What to do?",
          // ? why does styling AppBar Text not work??
          // ? Or i should be asking how to make it work??? 🤔
          // style: GoogleFonts.poppins(
          //   fontSize: 20,
          // ),
          // textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: _addTaskModal,
            icon: Icon(Icons.add_rounded),
            color: Colors.blue[900],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: mainContent),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTaskModal,
        backgroundColor: Colors.blue[50],
        child: Icon(
          Icons.add_rounded,
          color: Colors.blue[900],
        ),
      ),
    );
  }
}

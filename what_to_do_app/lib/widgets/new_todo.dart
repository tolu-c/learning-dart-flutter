import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:what_to_do_app/model/todo.dart';

final dateFormatter = DateFormat.yMd();

class NewTodo extends StatefulWidget {
  const NewTodo({super.key, required this.onAddTask});

  final Function(Todo task) onAddTask;

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  DateTime? deadline;
  final _taskController = TextEditingController();

  void _openDatePicker() async {
    final now = DateTime.now();
    final lastDate = DateTime(now.year + 10, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: lastDate,
    );
    setState(() {
      deadline = pickedDate;
    });
  }

  void _addTask() {
    // * input validation
    if (_taskController.text.trim().isEmpty || deadline == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input!"),
          content: const Text(
              "Please make sure a valid task and deadline was entered"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            ),
          ],
        ),
      );
      return;
    }
    // * add task
    widget.onAddTask(
      Todo(task: _taskController.text, reminder: deadline!),
    );
    // * close modal when task is added
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        48,
        20,
        20,
      ),
      child: Column(
        children: [
          TextField(
            // autofocus: true,
            maxLength: 64,
            controller: _taskController,
            decoration: InputDecoration(
              label: Text(
                "Task",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                deadline == null
                    ? "Set a deadline for the task"
                    : dateFormatter.format(deadline!),
              ),
              SizedBox(
                width: 16,
              ),
              IconButton(
                onPressed: _openDatePicker,
                icon: Icon(Icons.calendar_month_rounded),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Cancel",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.red[600],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: _addTask,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue[50]),
                ),
                child: Text(
                  "Add",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.blue[800],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

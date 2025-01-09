import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_to_do_app/model/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.task,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[900],
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.alarm_rounded,
                  size: 24,
                  color: Colors.grey[900],
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  todo.formatReminder,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[850],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

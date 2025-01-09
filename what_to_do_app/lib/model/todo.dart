import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateFormatter = DateFormat.yMd();

class Todo {
  Todo({required this.task, required this.reminder}) : id = uuid.v4();

  final String id;
  final String task;
  final DateTime reminder;

  String get formatReminder => dateFormatter.format(reminder);
}

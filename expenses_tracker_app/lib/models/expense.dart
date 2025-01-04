import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMd();
const uuid = Uuid();

enum ExpenseCategory { food, travel, leisure, work }

const expenseCategoryIcons = {
  ExpenseCategory.food: Icons.lunch_dining_rounded,
  ExpenseCategory.travel: Icons.flight_takeoff_rounded,
  ExpenseCategory.leisure: Icons.movie_rounded,
  ExpenseCategory.work: Icons.work_rounded,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  String get formattedDate => dateFormatter.format(date);
}

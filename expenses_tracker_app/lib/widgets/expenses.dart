import 'package:expenses_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_tracker_app/models/expense.dart';
import 'package:expenses_tracker_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime.now(),
      category: ExpenseCategory.work,
    ),
    Expense(
      title: "Cinema",
      amount: 15,
      date: DateTime.now(),
      category: ExpenseCategory.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
      isScrollControlled: true,
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add_rounded),
          ),
        ],
        title: const Text(
          "My Expenses Tracker",
          // textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          const Text(
            'My Expenses Chart',
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}

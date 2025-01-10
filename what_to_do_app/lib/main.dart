import 'package:flutter/material.dart';
import 'package:what_to_do_app/widgets/what_todo.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.blueAccent.shade700);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What To Do',
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ),
        ),
      ),
      home: const WhatTodo(),
    );
  }
}

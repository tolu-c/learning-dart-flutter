import 'package:flutter/material.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  var activeScreen = 'home';

  void changeScreen() {
    setState(() {
      activeScreen = 'questions';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomeScreen(changeScreen);

    if (activeScreen == 'questions') {
      screenWidget = const QuestionsScreen();
    }

    return MaterialApp(
      title: "Quiz App",
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent.shade700, Colors.blue.shade900],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

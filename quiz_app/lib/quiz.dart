import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'home';

  void changeScreen(String screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);
    });

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomeScreen(() {
      changeScreen('questions');
    });

    if (activeScreen == 'home') {
      selectedAnswers = [];
    }
    if (activeScreen == 'questions') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: selectAnswer,
      );
    } else {
      if (activeScreen == 'results') {
        screenWidget = ResultsScreen(
          restartQuiz: () {
            changeScreen('home');
          },
          chosenAnswers: selectedAnswers,
        );
      }
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

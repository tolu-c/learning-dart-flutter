import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "The Question...",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 24,
          ),
          AnswerButton(
            answer: "Answer 1",
            onPress: () {},
          ),
        ],
      ),
    );
  }
}

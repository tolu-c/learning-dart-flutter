import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.restartQuiz, required this.chosenAnswers});

  final void Function() restartQuiz;
  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i + 1,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        'selected_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = summaryData;
    final totalQuestionsLength = questions.length;
    final correctQuestionsLength = summaryData
        .where((question) =>
            question['selected_answer'] == question['correct_answer'])
        .length;

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "You answered $correctQuestionsLength out of $totalQuestionsLength questions correctly!",
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          QuestionsSummary(
            summaryData: summaryData,
          ),
          const SizedBox(
            height: 28,
          ),
          TextButton.icon(
            icon: const Icon(
              Icons.refresh_rounded,
              size: 24,
              color: Colors.white,
            ),
            onPressed: restartQuiz,
            label: Text(
              "Restart Quiz",
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

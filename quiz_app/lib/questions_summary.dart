import 'package:flutter/material.dart';
import 'package:quiz_app/question_summary.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    // final isQuestionCorrect = summaryData;
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (summary) {
              return QuestionSummary(summary: summary);
            },
          ).toList(),
        ),
      ),
    );
  }
}

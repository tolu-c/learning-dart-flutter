import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map(
        (summary) {
          return Row(
            children: [
              Text((summary['question_index'] as int).toString()),
              Column(
                children: [
                  Text(summary['question'] as String),
                  SizedBox(
                    height: 5,
                  ),
                  Text(summary['selected_answer'] as String),
                  Text(summary['correct_answer'] as String),
                ],
              )
            ],
          );
        },
      ).toList(),
    );
  }
}

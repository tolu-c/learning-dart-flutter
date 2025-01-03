import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summary});

  final Map<String, Object> summary;
  @override
  Widget build(BuildContext context) {
    final isQuestionCorrect =
        summary['correct_answer'] == summary['selected_answer'];
    final questionIndexBackgroundColor =
        isQuestionCorrect ? Colors.green : Colors.red;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: questionIndexBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                (summary['question_index'] as int).toString(),
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summary['question'] as String,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  summary['selected_answer'] as String,
                  style: GoogleFonts.poppins(
                    color: Colors.blue[300],
                    fontSize: 14,
                  ),
                ),
                Text(
                  summary['correct_answer'] as String,
                  style: GoogleFonts.poppins(
                    color: Colors.yellow[700],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

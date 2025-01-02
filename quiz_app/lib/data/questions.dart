import 'package:quiz_app/models/quiz_questions.dart';

const List<QuizQuestions> questions = [
  QuizQuestions(
    text: "What are the main building blocks of Flutter UIs",
    answers: ["Widgets", "Components", 'Blocks', "Functions"],
  ),
  QuizQuestions(
    text: "How are Flutter UIs built?",
    answers: [
      "By combining widgets in code",
      "By combining widgets in a visual manner",
      "By defining widgets in config files",
      "By using XCode for iOs and Android Studio for Android"
    ],
  ),
];

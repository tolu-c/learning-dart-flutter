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
  QuizQuestions(
    text: 'What\'s the purpose of a StatefulWidget?',
    answers: [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestions(
    text:
        'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    answers: [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQuestions(
    text: 'What happens if you change data in a StatelessWidget?',
    answers: [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuizQuestions(
    text: 'How should you update data inside of StatefulWidgets?',
    answers: [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
];

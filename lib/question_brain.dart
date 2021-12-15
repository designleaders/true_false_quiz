import 'questions.dart';

class QuestionsBrain {
  int _questionIndex = 0;
  List<Questions> _questionBank = [
    Questions(
      'Who is your hero?',
      true,
    ),
    Questions(
      'If you could live anywhere, where would it be?',
      false,
    ),
    Questions(
      'What is your biggest fear?',
      false,
    ),
    Questions(
      'What is your favorite family vacation?',
      true,
    ),
    Questions(
      'What would you change about yourself if you could?',
      true,
    ),
    Questions(
      'What really makes you angry?',
      false,
    ),
  ];

  void nextPage() {
    if (_questionIndex < _questionBank.length - 1) {
      _questionIndex++;
    }
  }

  bool isFinished() {
    if (_questionIndex >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionIndex].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionIndex].questionAnswer;
  }

  void reset() {
    _questionIndex = 0;
  }
}

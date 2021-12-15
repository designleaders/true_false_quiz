import 'package:flutter/material.dart';
import './question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionsBrain questions = QuestionsBrain();

void main() => runApp(TrueFalse());

class TrueFalse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> addIconList = [];

  answerCheck(bool valueChecking) {
    bool correctAnswer = questions.getQuestionAnswer();
    setState(() {
      if (questions.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.warning,
          title: "FINISH",
          desc: "You have reached the last quiz question.",
        ).show();
        questions.reset();
        addIconList = [];
      } else {
        if (correctAnswer == valueChecking) {
          addIconList.add(
            Icon(Icons.check, color: Colors.green),
          );
        } else {
          addIconList.add(
            Icon(Icons.close, color: Colors.red),
          );
        }
        questions.nextPage();
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                questions.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'True',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                //questions.questionBank[questionIndex].questionAnswer = true;
                answerCheck(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
                color: Colors.red,
                child: Text(
                  'False',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  answerCheck(false);
                }),
          ),
        ),
        Row(
          children: addIconList,
        ),
      ],
    );
  }
}

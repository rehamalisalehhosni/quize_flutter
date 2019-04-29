import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quize.dart';
import '../ui/answer_button.dart';
import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';
import './score.dart';

class QuizePage extends StatefulWidget {
  @override
  _QuizePageState createState() => _QuizePageState();
}

class _QuizePageState extends State<QuizePage> {
  Question currentQuestion;
  Quize quize= new Quize([
            new Question("first Question", false),
            new Question("second Question", false),
            new Question("third Question", true)
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible=false;

  @override
  void initState() {
    super.initState();
    currentQuestion=quize.nextQuestion;
    questionText=currentQuestion.question;
    questionNumber=quize.questionNumber;
  }
  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quize.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          children: <Widget>[
            AnswerButton(true, ()=>handleAnswer(true)),
            new QuestionText(questionText,questionNumber),
            AnswerButton(false,()=>handleAnswer(false)),
          ],
        ),
        overlayShouldBeVisible==true? new CorrectWrongOverlay(isCorrect,() {
          if(quize.length==questionNumber){
           Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new Score(quize.length,quize.score) ),(Route route)=>route==null);
            return;
          }
          currentQuestion = quize.nextQuestion;
            this.setState(() {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quize.questionNumber;
            });
        }):Container(),
      ],
    );
  }
}

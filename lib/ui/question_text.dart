import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final String _question;
  final int _question_number;
  QuestionText(this._question, this._question_number);
  @override
  _QuestionTextState createState() => _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText>
    with SingleTickerProviderStateMixin {
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;
  @override
  void initState() {
        super.initState();
    _fontSizeAnimationController = new AnimationController(duration: new Duration(milliseconds: 500), vsync: this);
    _fontSizeAnimation = new CurvedAnimation(parent: _fontSizeAnimationController, curve: Curves.bounceOut);
    _fontSizeAnimation.addListener(() => this.setState(() {}));
    _fontSizeAnimationController.forward();

  }

 @override
void didUpdateWidget (QuestionText oldWidget) {
  super.didUpdateWidget(oldWidget);
  if(oldWidget._question!=widget._question){
    _fontSizeAnimationController.reset();
    _fontSizeAnimationController.forward();

  }
  
}
  @override
  void dispose() {
    _fontSizeAnimationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new Material(
        color: Colors.white,
        child: Padding(
          padding: new EdgeInsets.symmetric(vertical: 20.0),
          child: Center(
              child: new Text(
            'statment ' +
                widget._question_number.toString() +
                ' : ' +
                widget._question.toString() +
                ' ',
            style: new TextStyle(fontSize: _fontSizeAnimation.value * 15),
          )),
        ));
  }
}

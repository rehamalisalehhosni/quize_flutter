import 'package:flutter/material.dart';
import './quizePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.greenAccent,
      child: InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizePage())),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Lets Start!", style: new TextStyle(color: Colors.white , fontSize: 50.0,fontWeight: FontWeight.bold),),
            new Text("Tap To Start!" , style: new TextStyle(color: Colors.white , fontSize: 20.0,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      
    );
  }
}
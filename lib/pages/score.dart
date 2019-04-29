import 'package:flutter/material.dart';
import './home_page.dart';

class Score extends StatelessWidget {
  final int score;
  final int totalQuestion;
  Score(this.score,this.totalQuestion);
  @override
  Widget build(BuildContext context) {
    return new Material(
      color:  Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            new Text("Your score is ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),
            new Text(score.toString()+"/"+totalQuestion.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0)),
            IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 40.0,
              onPressed: ()=> Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new  HomePage() ),(Route route)=>route==null),
            )
        ],
      ),
    );
  }
}
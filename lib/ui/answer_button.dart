import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool _answer;
  final VoidCallback _ontap;
  AnswerButton(this._answer,this._ontap);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new Material(
        color: _answer == true ? Colors.greenAccent : Colors.redAccent,
        child: InkWell(
          onTap: _ontap ,
          child: Center(
            child: Container(
              decoration: BoxDecoration(border: new Border.all(color: Colors.white,width: 5.0)),
              padding: EdgeInsets.all(4.0),
              child: new Text(_answer == true ? "True":"False",style: new TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.bold), ) ,
            ),
          ),
        ),
      ),
    );
  }
}

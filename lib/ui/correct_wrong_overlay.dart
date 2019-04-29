import 'package:flutter/material.dart';
import 'dart:math';
class CorrectWrongOverlay extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;
  CorrectWrongOverlay(this._isCorrect,this._onTap);
  @override
  _CorrectWrongOverlayState createState() => _CorrectWrongOverlayState();
}

class _CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {
  Animation <double> _animationIcon;
  AnimationController _animationIconController;
  @override
  void initState() {
    _animationIconController =new AnimationController(duration: Duration(seconds:1),vsync: this);
    _animationIcon=new CurvedAnimation(parent: _animationIconController,curve: Curves.linear);
    _animationIcon.addListener(()=>this.setState((){}));
   _animationIconController.forward(); 
  }
  @override
  void dispose() {
   _animationIconController.dispose();    
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black45,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),
              child: Transform.rotate(
                angle: _animationIcon.value * 2 * pi ,
                child: new Icon(widget._isCorrect==true? Icons.done:Icons.clear,size: _animationIcon.value  * 80.0,),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20.0),),
            new Text(widget._isCorrect==true? "Correct":"Wrong" ,style: new TextStyle(fontSize: 20.0,color: Colors.white),),
          ],
        ),
      ),
    );
  }
}

class PI {
}

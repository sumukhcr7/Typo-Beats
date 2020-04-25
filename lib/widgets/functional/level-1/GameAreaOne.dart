import 'dart:ui';
import 'package:HYPER_SYNK/widgets/functional/level-1/Level1StartWidget.dart';
import 'package:HYPER_SYNK/widgets/functional/level-1/car.dart';
import 'package:HYPER_SYNK/widgets/functional/level-1/carOne.dart';
import 'package:HYPER_SYNK/widgets/functional/level-1/carTwo.dart';

import 'package:HYPER_SYNK/widgets/functional/level-1/wordOne.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';




bool makeGameOver = false;

class GameAreaOne extends BaseGame {
  bool checkOnce = true;
  double tilesize;
  Object car = {};
  Object carOne ={};
  Object carTwo ={};
  Object word = {};
  Size dimenstions;
  var hpos;
  double tileSize;
  String textTyped = '';
  GameAreaOne(this.dimenstions);
  Rect tilee;
  Paint tilePaint;
  int ocount=0;
  String over;
  String checkword=randomWordsArray[0].toString();
  Rect board;
  Paint boardPaint;
  

  changeText(text, clearTextInput) {
    textTyped = text;
    if ( randomWordsArray[count].toString() == textTyped) {
      points = points + 1;
      clearTextInput();
    }
  }

  paintrect(newtext){
    checkword=newtext;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
     board = Rect.fromLTWH(290, 13, 200, 100);
      boardPaint = Paint();
      boardPaint.color = Colors.white;
    hpos=size.height;
    String text = "Score: ${points.toString()}";
    TextPainter p = Flame.util
        .text(text, color: Colors.white, fontSize: 36.0 ,fontFamily: 'Halo');
    TextPainter x = Flame.util
        .text(checkword, color: Colors.black, fontSize: 40.0, fontFamily: 'Halo');
    canvas.drawRect(board, boardPaint);
    if(points>=8)
    {
      over = "Hurray you won the First Place";
    }
    else if(points>5 && points<8)
    {
      over = "You finished in the second place";
    }
    else
    {
     over ="You finished THIRD better luck next time";
    }
    TextPainter overGame = Flame.util
        .text(over, color: Colors.white, fontSize: 38.0, fontFamily: 'Halo');
    gameOver
        ? overGame.paint(canvas, Offset((size.width / 5)+10, size.height / 2))
        : x.paint(canvas, new Offset(350, 40));
         p.paint(canvas,  Offset(900, 40));  
  }
  double creationTimer = 0.0;
  @override
  void update(double t) {
    if (gameOver != true) {
          paintrect(randomWordsArray[count].toString());
      creationTimer += t;
      if (creationTimer >= 4) {
        creationTimer = 0.0;
        if (count == numberOfWords - 1) {
             level1GameMain();
          gameOver = true;
        }
        if (numberOfWords == 26) {
          if (count == 5) {
            BALLSPEED = BALLSPEED + 25;
          } else if (count == 10) {
            BALLSPEED = BALLSPEED + 20;
          }
        }
        
      
        car = new Car(dimenstions, 4.5, 6);
        carOne = new CarOne(dimenstions, 2, 6);
        carTwo = new CarTwo(dimenstions, 7, 6);
        word = new Word(
            dimenstions, 630.0, 9 , randomWordsArray[count].toString());
        
        if (ocount<1){
        add(car);
        add(carOne);
        add(carTwo);
        
        ocount = ocount + 1;
        }
        count = count + 1;
      }
      add(word);
      
      super.update(t);
    }
  }
   void tapInput(Offset position) {
    print('tapped');
  }
}

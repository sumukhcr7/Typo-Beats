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
  

  changeText(text, clearTextInput) {
    textTyped = text;
    if (randomWordsArray[count - 1].toString() == textTyped) {
      points = points + 1;
      clearTextInput();
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    hpos=size.height;
    String text = "Score: ${points.toString()}";
    TextPainter p = Flame.util
        .text(text, color: Colors.white, fontSize: 32.0, fontFamily: 'Halo');
    //int tempnumberOfWords = numberOfWords - 1;
    //double percentage = (points / tempnumberOfWords) * 100;
    if(points>=10)
    {
      over = "Hurray you won the First Place";
    }
    else if(points>5 && points<10)
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
        ? overGame.paint(canvas, Offset(size.width / 5, size.height / 2))
        : p.paint(canvas, new Offset(20, 40));
    // tilee = Rect.fromLTWH(0, 0, 5, 5);
    // tilePaint = Paint();
    // tilePaint.color = Color(0xff6ab04c);
    // canvas.drawRect(tilee, tilePaint);

    
  }

  double creationTimer = 0.0;
  @override
  void update(double t) {
    if (gameOver != true) {
      creationTimer += t;
      if (creationTimer >= 4) {
        creationTimer = 0.0;
        if (count == numberOfWords - 1) {
          level1GameMain(true);
          gameOver = true;
        }
        if (numberOfWords == 26) {
          if (count == 5) {
            BALLSPEED = BALLSPEED + 25;
          } else if (count == 10) {
            BALLSPEED = BALLSPEED + 20;
          }
        }
        
      
        car = new Car(dimenstions, 5, 6);
        carOne = new CarOne(dimenstions, 1, 6);
        carTwo = new CarTwo(dimenstions, 9, 6);
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

  // @override
  // void resize(Size size) {
  //   tilesize = size.width;
  //   //print(maxY);
  // }
}

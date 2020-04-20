import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../getRandomWord.dart';
import 'Level2StartWidget.dart';
import 'Word.dart';
import 'ball.dart';

class GameArea extends BaseGame {
  bool checkOnce = true;

  Object ball = {};
  Object word = {};
  Size dimenstions;
  String textTyped;
  String randomWord='typo';
  bool isExplode=false;
  List typedTextArry=[];
  List randomWordsArray=['typo'];

  GameArea(this.dimenstions);

  changeText(text, clearTextInput) {
    textTyped = text;
    if (randomWord == textTyped) {
      clearTextInput();
    }
    // print(getRandomWord().toString());
  }

  // handleSubmit(value) {
  //   textTyped = value;
  // }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    String text = points.toString();
    TextPainter p = Flame.util
        .text(text, color: Colors.white, fontSize: 48.0, fontFamily: 'Halo');
    String over = "Game over";
    TextPainter overGame = Flame.util
        .text(over, color: Colors.white, fontSize: 48.0, fontFamily: 'Halo');
    gameOver
        ? overGame.paint(canvas, Offset(size.width / 5, size.height / 2))
        : p.paint(canvas,
            new Offset(size.width - p.width - 10, size.height - p.height - 10));
  }

  double creationTimer = 0.0;
  @override
  void update(double t) {
    // print("called");
    if(gameOver!=true){
    creationTimer += t;
    if (creationTimer >= 4) {
      creationTimer = 0.0;

   
      // if (randomWord == textTyped) {
      //   isExplode = true;
      // }
      // print(randomWordsArray);
      // print(typedTextArry);
      // print("inodddddddddd $isExplode");
      int tempLengthOfRandomWords=randomWordsArray.length-1.toInt();
      int tempLengthOfTypedTextArray=randomWordsArray.length-1.toInt();
            // bool tempLengthOfRandomWords=true;
      // bool tempLengthOfTypedTextArray=true;
      if (!isExplode) {
          randomWord=getRandomWord().toString();
     randomWord=randomWord;
     randomWordsArray.add(randomWord);
    //  tempLengthOfRandomWords=randomWordsArray.length-1.toInt();
    //  tempLengthOfTypedTextArray=typedTextArry.length.toInt();
    //  print("INSIDE");
                  // print(tempLengthOfRandomWords==tempLengthOfTypedTextArray);

    //  print("Random words length ${tempLengthOfRandomWords-1}");
    //  print("typed text length $tempLengthOfTypedTextArray");
    //  bool a=int.parse(tempLengthOfRandomWords) ==int.parse(tempLengthOfTypedTextArray)
       print(isDestroyed);
        ball = new Ball(dimenstions, 5, 0, isExplode, isDestroyed);
        word = new Word(dimenstions, 630.0, 0.35, randomWord, isExplode, isDestroyed);
        add(ball);
        add(word);
      } else {
             print("OUTSIDE");

            //  print(tempLengthOfRandomWords==tempLengthOfTypedTextArray);

        points = points + 1;
        isDestroyed=true;
               print(isDestroyed);

        // previosPoints= points;
        ball = new Ball(dimenstions, -1, -1, isExplode, isDestroyed);
        word = new Word(dimenstions, -1, -1, randomWord,isExplode, isDestroyed);
        add(ball);
        add(word);
        textTyped='';
        isExplode=false;
      }
    }
    super.update(t);
    }
  }

  void tapInput(Offset position) {
    touchPositionDx = position.dx;
    touchPositionDy = position.dy;
    bulletStartStop = true;
  }

  void dragInput(Offset position) {
    touchPositionDx = position.dx;
    touchPositionDy = position.dy;
    bulletStartStop = true;
  }

  void onUp() {
    bulletStartStop = false;
  }
}

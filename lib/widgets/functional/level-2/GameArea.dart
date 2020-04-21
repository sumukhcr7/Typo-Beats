import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'Level2StartWidget.dart';
import 'Word.dart';
import 'ball.dart';

bool makeGameOver = false;

class GameArea extends BaseGame {
  bool checkOnce = true;
  Object ball = {};
  Object word = {};
  Size dimenstions;
  String textTyped = '';
  GameArea(this.dimenstions);

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
    String text = "Score: ${points.toString()}";
    TextPainter p = Flame.util
        .text(text, color: Colors.white, fontSize: 32.0, fontFamily: 'Halo');
    int tempnumberOfWords = numberOfWords - 1;
    double percentage = (points / tempnumberOfWords) * 100;
    String over =
        "Game is completed, your score percentage is ${percentage.toString()}%";
    TextPainter overGame = Flame.util
        .text(over, color: Colors.white, fontSize: 38.0, fontFamily: 'Halo');
    gameOver
        ? overGame.paint(canvas, Offset(size.width / 5, size.height / 2))
        : p.paint(canvas, new Offset(50, 5));
  }

  double creationTimer = 0.0;
  @override
  void update(double t) {
    if (gameOver != true) {
      creationTimer += t;
      if (creationTimer >= 4) {
        creationTimer = 0.0;
        if (count == numberOfWords - 1) {
          gameOver = true;
        }
        if (numberOfWords == 26) {
          if (count == 5) {
            BALLSPEED = BALLSPEED + 25;
          } else if (count == 10) {
            BALLSPEED = BALLSPEED + 20;
          }
        } else if (numberOfWords == 51) {
          if (count == 10) {
            BALLSPEED = BALLSPEED + 20;
          } else if (count == 30) {
            BALLSPEED = BALLSPEED + 20;
          } else if (count == 40) {
            BALLSPEED = BALLSPEED + 10;
          }
        } else if (numberOfWords == 101) {
          if (count == 20) {
            BALLSPEED = BALLSPEED + 20;
          } else if (count == 40) {
            BALLSPEED = BALLSPEED + 20;
          } else if (count == 60) {
            BALLSPEED = BALLSPEED + 10;
          } else if (count == 80) {
            BALLSPEED = BALLSPEED + 10;
          }
        }
        ball = new Ball(dimenstions, 5, 0);
        word = new Word(
            dimenstions, 630.0, 0.35, randomWordsArray[count].toString());
        add(ball);
        add(word);
        count = count + 1;
      }

      super.update(t);
    }
  }
}

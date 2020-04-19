import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'Level2StartWidget.dart';
import 'Word.dart';
import 'ball.dart';

class GameArea extends BaseGame {
  bool checkOnce = true;

  Object ball = {};
  Object word = {};
  Size dimenstions;
  String textTyped;
  String randomWord = 'hey';

  GameArea(this.dimenstions);

  changeText(text, clearTextInput) {
    textTyped = text;
    if (randomWord == textTyped) {
      clearTextInput();
    }
  }

  handleSubmit(value) {
    textTyped = value;
  }

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
    creationTimer += t;
    if (creationTimer >= 4) {
      creationTimer = 0.0;
      bool isExplode = false;
      if (randomWord == textTyped) {
        isExplode = true;
      }
      if (isExplode == false) {
        ball = new Ball(dimenstions, 5, 0, isExplode);
        word = new Word(dimenstions, 635.0, 0.35, randomWord, isExplode);
        add(ball);
        add(word);
      } else {
        points = points + 1;
        ball = new Ball(dimenstions, -1, -1, isExplode);
        word = new Word(dimenstions, -1, -1, randomWord, isExplode);
      }
    }
    super.update(t);
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

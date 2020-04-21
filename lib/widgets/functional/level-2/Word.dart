import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Level2StartWidget.dart';

class Word extends SpriteComponent {
  Size dimenstions;
  double postion;
  double ypostion;
  double maxY;
  String word;

  Word(this.dimenstions, this.postion, this.ypostion, this.word);

  @override
  void render(Canvas canvas) {
    if (!gameOver) {
      super.render(canvas);
      String text = word;
      TextPainter p = Flame.util.text(
        text,
        color: Colors.white,
        fontSize: 28.0,
      );
      p.paint(canvas, new Offset(postion, ypostion));
    }
  }

  @override
  void update(double t) {
    if (gameOver != true) {
      y += gameOver ? -1 : (t * BALLSPEED);
      ypostion = gameOver ? -1 : y;
    }
  }

  bool destroy() {
    if (gameOver == true) {
      return true;
    }
    return false;
  }

  @override
  void resize(Size size) {
    this.x = (BALL_SIZE * postion);
    this.y = BALL_SIZE * ypostion;
    this.maxY = size.height;
  }
}

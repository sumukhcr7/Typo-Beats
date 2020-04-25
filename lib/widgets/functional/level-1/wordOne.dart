import 'dart:ui';
import 'package:HYPER_SYNK/widgets/functional/level-1/Level1StartWidget.dart';
import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Word extends SpriteComponent {
  Size dimenstions;
  double postion;
  double ypostion;
  double maxY;
  String word;
  Rect board;
  Paint boardPaint;

  Word(this.dimenstions, this.postion, this.ypostion, this.word);

  @override
  void render(Canvas canvas) {
    if (!gameOver) {
      super.render(canvas);
      String text = word;
      board = Rect.fromLTWH(350, 0, 400, 100);
      boardPaint = Paint();
      boardPaint.color = Color(0xff6ab04c);
      TextPainter p = Flame.util.text(
        text,
        color: Colors.black,
        fontSize: 0.0,
      );
      p.paint(canvas, new Offset(postion, ypostion));
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

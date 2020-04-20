import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Level2StartWidget.dart';

class Word extends SpriteComponent {
  String word;
  Size dimenstions;
  double postion;
  double ypostion;
  bool isExplode;
  double maxY;
  bool isLengthEqualOfTypedAndRandom;
  var previousPoints=0;
  Word(
      this.dimenstions, this.postion, this.ypostion, this.word, this.isExplode, this.isLengthEqualOfTypedAndRandom);

  @override
  void render(Canvas canvas) {
    if(!isExplode){
    super.render(canvas);
    String text = word;
    TextPainter p = Flame.util.text(
      text,
      color: Colors.black,
      fontSize: 28.0,
    );
    p.paint(canvas, new Offset(postion, ypostion));
    }
  }

  @override
  void update(double t) {
    y += isExplode||gameOver ? 0 : (t * BALLSPEED);
    ypostion = isExplode||gameOver ?0:y;
  }

  bool destroy() {
    if (isExplode) {
      return true;
    }
    if (y == null || maxY == null) {
      return false;
    }
    bool destroy = y >= maxY + BALL_SIZE / 2;
    print("$previousPoints pints $points");
    if (destroy==true&&previousPoints==points) {
      gameOver = true;

      print("Game over");
      return true;
    }
    else{
      previousPoints=points;
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

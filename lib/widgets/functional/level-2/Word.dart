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

  Sprite bgSprite;

  Word(
      this.dimenstions, this.postion, this.ypostion, this.word, this.isExplode);

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
    y += isExplode ? -1 : (t * BALLSPEED);
    ypostion = isExplode ?-1:y;
  }

  @override
  bool destroy() {
    // if (explode) {
    //   return true;
    // }
    // if (y == null || maxY == null) {
    //   return false;
    // }
    // bool destroy = y >= maxY + BALL_SIZE / 2;
    // if (destroy) {
    //   gameOver = true;

    //   print("Game over");
    //   return true;
    // }
    return isExplode;
  }

  @override
  void resize(Size size) {
    this.x = (BALL_SIZE * postion);
    this.y = BALL_SIZE * ypostion;
    this.maxY = size.height;
  }
}

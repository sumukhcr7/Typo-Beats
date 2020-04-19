import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flutter/cupertino.dart';
import 'Level2StartWidget.dart';

class Ball extends SpriteComponent {
  Size dimenstions;
  int postion;
  int ypostion;
  double maxY;
  bool isExplode;  

  Ball(this.dimenstions, this.postion, this.ypostion, this.isExplode)
      : super.square(BALL_SIZE, 'blueball.png');

  @override
  void update(double t) {
    y += isExplode ? -1 : (t * BALLSPEED);
  }

  // @override
  bool destroy() {
    if (isExplode) {
      return true;
    }
    if (y == null || maxY == null) {
      return false;
    }
    return false;
    // bool destroy = y >= maxY + BALL_SIZE / 2;
    // if (destroy) {
    //   gameOver = true;

    //   print("Game over");
    //   return true;
    // }
    // return destroy;
  }

  @override
  void resize(Size size) {
    this.x = (BALL_SIZE * postion);
    this.y = BALL_SIZE * ypostion;
    this.maxY = size.height;
  }
}

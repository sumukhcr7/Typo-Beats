import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flutter/cupertino.dart';
import 'Level2StartWidget.dart';

class Ball extends SpriteComponent {
  Size dimenstions;
  int postion;
  int ypostion;
  double maxY;

  Ball(this.dimenstions, this.postion, this.ypostion)
      : super.square(BALL_SIZE, 'blueball.png');

  @override
  void update(double t) {
    if (gameOver != true) {
      y += gameOver ? -1 : (t * BALLSPEED);
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

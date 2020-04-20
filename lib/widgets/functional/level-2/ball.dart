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
  bool isLengthEqualOfTypedAndRandom; 
  var previousPoints;

  Ball(this.dimenstions, this.postion, this.ypostion, this.isExplode, this.isLengthEqualOfTypedAndRandom)
      : super.square(BALL_SIZE, 'blueball.png');

  @override
  void update(double t) {
    y += isExplode||gameOver ? 0 : (t * BALLSPEED);
  }

  // @override
  bool destroy() {
    
    // print("I CAME TO BALL");
    // print(isLengthEqualOfTypedAndRandom);
    if (isExplode) {
      return true;
    }
    if (y == null || maxY == null) {
      return false;
    }
    bool destroy = y >= maxY + BALL_SIZE / 2;
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

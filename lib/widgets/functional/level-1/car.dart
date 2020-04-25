import 'dart:ui';
import 'package:HYPER_SYNK/widgets/functional/level-1/Level1StartWidget.dart';
import 'package:flame/components/component.dart';
import 'package:flutter/cupertino.dart';


class Car extends SpriteComponent {
  Size dimenstions;
  double postion;
  int ypostion;
  double maxY;

  Car(this.dimenstions, this.postion, this.ypostion)
      : super.square(BALL_SIZE, 'FAVPNG_car-laferrari-isuzu-erga-clip-art_Sxzv3MEB.png');

  @override
  void update(double t) {
    if (gameOver != true) {
      y += gameOver ? -1 :((t * -BALLSPEED));
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

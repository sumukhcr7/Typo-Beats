import 'dart:ui';
import 'package:HYPER_SYNK/widgets/functional/level-1/Level1StartWidget.dart';
import 'package:flame/components/component.dart';
import 'package:flutter/cupertino.dart';


class CarTwo extends SpriteComponent {
  Size dimenstions;
  int postion;
  int ypostion;
  double maxY;

  CarTwo(this.dimenstions, this.postion, this.ypostion)
      : super.square(BALL_SIZE, 'FAVPNG_download-car-birds-eye-view_tShBzAJq.png');

  @override
  void update(double t) {
    //print(t);
    if (gameOver != true) {
      y += gameOver ? -1 :(0.9- (t *(BALLSPEED)));
      // print('****');
      // print(y);
      // print('#####');
      
      
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
    //print(maxY);
  }
}

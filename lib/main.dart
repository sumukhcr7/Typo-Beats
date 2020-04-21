import 'package:HYPER_SYNK/theme/Theme.dart';
import 'package:HYPER_SYNK/widgets/functional/level-1/Level1StartWidget.dart';
import 'package:HYPER_SYNK/widgets/functional/level-2/Level2StartWidget.dart';
import 'package:HYPER_SYNK/widgets/functional/login/LoginWidget.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(new TypoBeatsApplication(from:'main'));
}

class TypoBeatsApplication extends StatelessWidget {
  final from;
  TypoBeatsApplication({this.from});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: colorPalatte(),
        debugShowCheckedModeBanner: false,
        home: from=='main'? LoginWidget() :from=='level1'?Level1StartWidget():Level2StartWidget()
      );
    
  }
}
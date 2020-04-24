import 'dart:async';
import 'dart:math';
import 'package:HYPER_SYNK/widgets/functional/levels/LevelsWidget.dart';
import 'package:HYPER_SYNK/widgets/functional/login/LoginWidget.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

import '../../../stub.dart';

class Level3PlayArea extends StatefulWidget {
  final level;
  final widthFrom;
  Level3PlayArea({this.level, this.widthFrom});
  Level3PlayAreaState createState() =>
      Level3PlayAreaState(level: level, widthFrom: widthFrom);
}

class Level3PlayAreaState extends State<Level3PlayArea> {
  final level;
  final widthFrom;
  var givenWordsArray;
  int numberOfWordsGiven;
  int points = 0;
  int randomWord;
  int _start;
  int _current;
  bool isTimerStarted = false;
  bool isGameOver = false;
  double percentage;
  Level3PlayAreaState({this.level, this.widthFrom});

  onClickOfLogout(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginWidget()),
        (Route<dynamic> route) => false);
  }

  void startTimer() {
    setState(() {
      isTimerStarted = true;
    });
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      double temppercentage = (points / numberOfWordsGiven) * 100;
      setState(() {
        percentage = temppercentage;
      });
      setState(() {
        isGameOver = true;
      });
      sub.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    if (level == 3) {
      randomWord = Random().nextInt(4);
    } else {
      randomWord = Random().nextInt(9);
    }
    var tempgivenWordsArray;
    if (level == 1) {
      _start = 60;
      _current = 60;
      tempgivenWordsArray = level1Sentences[randomWord].split(" ");
    } else if (level == 2) {
      _start = 120;
      _current = 120;
      tempgivenWordsArray = level2Sentences[randomWord].split(" ");
    } else if (level == 3) {
      _start = 180;
      _current = 180;
      tempgivenWordsArray = level1Sentences[randomWord].split(" ");
    }
    setState(() {
      givenWordsArray = tempgivenWordsArray;
      numberOfWordsGiven = tempgivenWordsArray.length;
    });
  }

  handleChangeText(text) {
    points = 0;
    var tempTextArray = text.split(' ');
    int lengthOfTempTextArray = tempTextArray.length;
    var tempWordsOfSentence = [];
    for (var i = 0; i < lengthOfTempTextArray; i++) {
      tempWordsOfSentence.add(givenWordsArray[i]);
    }
    for (int i = 0; i < lengthOfTempTextArray; i++) {
      if (tempTextArray[i].toString() == tempWordsOfSentence[i].toString()) {
        points = points + 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.black,
                    iconSize: 25,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LevelsWidget(),
                          ));
                    }),
                Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      'TYPO BEATS',
                      style: Theme.of(context).textTheme.headline4,
                    )),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16, right: 24),
                child: SizedBox(
                    width: 110,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      elevation: 1,
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Logout',
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(
                                Icons.power_settings_new,
                                size: 20,
                              )
                            ],
                          )),
                      onPressed: () {
                        onClickOfLogout(context);
                      },
                    ))),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height - 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("typing.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("$_current", style: Theme.of(context).textTheme.headline2),
                isGameOver == false
                    ? Flexible(
                        flex: 3,
                        child: Container(
                          height: 250,
                          width: widthFrom,
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(top: 24),
                                  child: Text(
                                    "Type the sentence given ",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 16, bottom: 24, left: 8, right: 8),
                                  child: Text(
                                    level == 1
                                        ? level1Sentences[
                                            randomWord != null ? randomWord : 4]
                                        : level == 2
                                            ? level2Sentences[randomWord != null
                                                ? randomWord
                                                : 4]
                                            : level3Sentences[randomWord != null
                                                ? randomWord
                                                : 4],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ))
                    : Flexible(
                        flex: 3,
                        child: Container(
                          height: 250,
                          width: widthFrom,
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(top: 24),
                                  child: Text(
                                    "GAME OVER",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 16, bottom: 24, left: 8, right: 8),
                                  child: Text(
                                      "You scored ${percentage.toStringAsFixed(2)}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black))),
                            ],
                          ),
                        )),
                isGameOver == false
                    ? Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        width: widthFrom,
                        child: TextField(
                            enabled: isTimerStarted ? true : false,
                            onChanged: (text) {
                              handleChangeText(text);
                            },
                            maxLines: null,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.white),
                                ),
                                hintText: "Enter text here",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 14))))
                    : Container(),
                isGameOver==false?
                SizedBox(
                    width: 110,
                    child: RaisedButton(
                      onPressed: () {
                        startTimer();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      elevation: 1,
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(top: 12, bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Start",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Icon(
                              Icons.play_arrow,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    )):Container()
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

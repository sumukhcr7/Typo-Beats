import 'package:HYPER_SYNK/widgets/functional/level-2/GameArea.dart';
import 'package:HYPER_SYNK/widgets/functional/level-2/ball.dart';
import 'package:HYPER_SYNK/widgets/functional/login/LoginContainer.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../getRandomWord.dart';



List randomWordsArray = getRandomWord();
int count = 0;
bool gameOver = false;
var BALLSPEED = 120.0;
const BALL_SIZE = 120.0;
var numberOfWords;

var points = 0;
Ball ball;
var game;

class Level2StartWidget extends StatefulWidget {
  final levelsModel;
  final store;

  Level2StartWidget({this.levelsModel, this.store});

  Level2StartWidgetState createState() =>
      Level2StartWidgetState(levelsModel: levelsModel, store: store);
}

class Level2StartWidgetState extends State<Level2StartWidget> {
  final levelsModel;
  final store;
  var radioValue;
  Level2StartWidgetState({this.levelsModel, this.store});

  onClickOfLogout(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginContainer()),
        (Route<dynamic> route) => false);
  }

  void _handleRadioValueChange(int value) {
    switch (value) {
      case 0:
        numberOfWords = 26;
        break;
      case 1:
        numberOfWords = 51;
        break;
      case 2:
        numberOfWords = 101;
        break;
    }
    setState(() {
      radioValue = value;
    });
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
                      Navigator.pop(context);
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                    flex: 3,
                    child: Container(
                      height: 350,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: 24),
                              child: Text(
                                "Level 2",
                                style: Theme.of(context).textTheme.headline5,
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 16, bottom: 24, left: 8, right: 8),
                              child: Text(
                                "INSTRUCTIONS: Type the words in the text box given on the balloons to avoid the balloons falling down and to score.",
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                          Container(
                              height: 150,
                              child: Column(
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    new Radio(
                                      value: 0,
                                      groupValue: radioValue,
                                      onChanged: (value) {
                                        _handleRadioValueChange(0);
                                      },
                                    ),
                                    new Text(
                                      'Level 1 (contains 25 words)',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ]),
                                  Row(children: <Widget>[
                                    new Radio(
                                      value: 1,
                                      groupValue: radioValue,
                                      onChanged: (value) {
                                        _handleRadioValueChange(1);
                                      },
                                    ),
                                    new Text(
                                      'Level 2 (contains 50 words)',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    )
                                  ]),
                                  Row(children: <Widget>[
                                    new Radio(
                                      value: 2,
                                      groupValue: radioValue,
                                      onChanged: (value) {
                                        _handleRadioValueChange(2);
                                      },
                                    ),
                                    new Text(
                                      'Level 3 (contains 100 words)',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    )
                                  ]),
                                ],
                              )),
                          SizedBox(
                              width: 150,
                              child: RaisedButton(
                                disabledColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0)),
                                elevation: 1,
                                color: Theme.of(context).accentColor,
                                textColor: Colors.white,
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 12, bottom: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Start',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Icon(
                                          Icons.play_arrow,
                                          size: 20,
                                        )
                                      ],
                                    )),
                                onPressed: radioValue != null
                                    ? () {
                                        level2GameMain(false);
                                      }
                                    : null,
                              )),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

level2GameMain(isGameOver) async {
  Flame.audio.disableLog();
  var dimensions = await Flame.util.initialDimensions();
  game = new GameArea(dimensions);
  runApp(MaterialApp(
      home: Scaffold(
          body: Container(
    decoration: new BoxDecoration(color: Colors.black
        // image: new DecorationImage(
        //   image: new AssetImage("assets/images/background.jpg"),
        //   fit: BoxFit.cover,
        // ),
        ),
    child: GameWrapper(game, isGameOver),
  ))));

  HorizontalDragGestureRecognizer horizontalDragGestureRecognizer =
      new HorizontalDragGestureRecognizer();

  Flame.util.addGestureRecognizer(horizontalDragGestureRecognizer
    ..onUpdate = (startDetails) => game.dragInput(startDetails.globalPosition));

  Flame.util.addGestureRecognizer(new TapGestureRecognizer()
    ..onTapDown = (TapDownDetails evt) => game.tapInput(evt.globalPosition));

  // Adds onUP feature to fire bullets
  Flame.util.addGestureRecognizer(new TapGestureRecognizer()
    ..onTapUp = (TapUpDetails evt) => game.onUp(evt.globalPosition));
}

class GameWrapper extends StatefulWidget {
  final GameArea game;
  final isGameOver;
  GameWrapper(this.game, this.isGameOver);
  @override
  GameWrapperState createState() => GameWrapperState(game, isGameOver);
}

class GameWrapperState extends State<GameWrapper> {
  final GameArea game;
  final isGameOver;
  bool makeGameOver = false;
  String textTyped;

  GameWrapperState(this.game, this.isGameOver);

  final textClearController = TextEditingController();

  clearTextInput() {
    textClearController.clear();
  }

  @override
  initState() {
    super.initState();
    if (isGameOver == true) {
      setState(() {
        makeGameOver = true;
      });
      print('making true');
    }
  }

  handleChangeOfText(text) async {
    setState(() {
      textTyped = text;
    });
    print(randomWordsArray);
    game.changeText(text, clearTextInput);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: new BoxDecoration(color: Colors.black
                // image: new DecorationImage(
                //   image: new AssetImage("assets/images/background.jpg"),
                //   fit: BoxFit.cover,
                // ),
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                  child: isGameOver == false ? game.widget : Container(),
                ),
                isGameOver == true
                    ? SizedBox(
                        width: 150,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          elevation: 1,
                          color: Theme.of(context).accentColor,
                          textColor: Colors.white,
                          child: Padding(
                              padding: EdgeInsets.only(top: 12, bottom: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Back',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Icon(
                                    Icons.play_arrow,
                                    size: 20,
                                  )
                                ],
                              )),
                          onPressed: () {
                            // level2GameMain();
                          },
                        ))
                    : SizedBox(
                        height: 80,
                        width: 300,
                        child: TextField(
                            controller: textClearController,
                            onChanged: (text) {
                              handleChangeOfText(text);
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Enter the text here",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 18)))),
              ],
            )));
  }
}

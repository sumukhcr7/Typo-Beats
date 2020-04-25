import 'package:HYPER_SYNK/widgets/functional/level-1/GameAreaOne.dart';
import 'package:HYPER_SYNK/widgets/functional/level-1/car.dart';
import 'package:HYPER_SYNK/widgets/functional/levels/LevelsWidget.dart';
import 'package:HYPER_SYNK/widgets/functional/login/LoginWidget.dart';
import 'package:HYPER_SYNK/widgets/getRandomWordsOne.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

List randomWordsArray = getRandomWord();
int count = 0;
bool gameOver = false;
var CARSPEED = 25.0;
var CAR1SPEED = 20.0;
var CAR2SPEED = 20.0;
const BALL_SIZE = 130.0;
var numberOfWords = 10;

var points = 0;
Car car;
var game;

class Level1StartWidget extends StatefulWidget {
  Level1StartWidgetState createState() => Level1StartWidgetState();
}

class Level1StartWidgetState extends State<Level1StartWidget> {
  var radioValue;

  onClickOfLogout(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginWidget()),
        (Route<dynamic> route) => false);
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                    flex: 3,
                    child: Container(
                      height: 200,
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
                                "TYPO RACER",
                                style: Theme.of(context).textTheme.headline5,
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 16, bottom: 24, left: 8, right: 8),
                              child: Text(
                                "INSTRUCTIONS: Type the words in the text box given on the car to avoid the cars crashinging down and to score.",
                                style: Theme.of(context).textTheme.bodyText1,
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
                                onPressed: () {
                                  level1GameMain();
                                },
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

level1GameMain() async {
  Flame.audio.disableLog();
  var dimensions = await Flame.util.initialDimensions();
  game = new GameAreaOne(dimensions);
  runApp(MaterialApp(
      home: Scaffold(
          body: Container(
    decoration: new BoxDecoration(
      image: new DecorationImage(
        image: new AssetImage("Roadff.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: GameWrapper(game),
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
  final GameAreaOne game;
  GameWrapper(this.game);
  @override
  GameWrapperState createState() => GameWrapperState(game);
}

class GameWrapperState extends State<GameWrapper> {
  final GameAreaOne game;
  bool makeGameOver = false;
  String textTyped;
  bool isBackButton;
  GameWrapperState(this.game);

  final textClearController = TextEditingController();

  clearTextInput() {
    textClearController.clear();
  }

  @override
  initState() {
    super.initState();
  }

  handleBackButton() {
    setState(() {
      isBackButton = true;
    });
    runApp(TypoBeatsApplication(from: 'level1'));
  }

  handleChangeOfText(text) async {
    setState(() {
      textTyped = text;
    });
    game.changeText(text, clearTextInput);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/Roadff.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        color: Colors.black,
                        height: 40,
                        width: 40,
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              handleBackButton();
                            })),
                    Container(
                        height: MediaQuery.of(context).size.height - 300,
                        width: MediaQuery.of(context).size.width,
                        child: game.widget),
                  ],
                ),
                SizedBox(
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
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18)))),
              ],
            )));
  }
}

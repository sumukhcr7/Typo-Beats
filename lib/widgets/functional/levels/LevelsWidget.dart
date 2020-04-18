import 'package:HYPER_SYNK/widgets/functional/level-1/Level1StartWidget.dart';
import 'package:HYPER_SYNK/widgets/functional/level-2/Level2StartWidget.dart';
import 'package:HYPER_SYNK/widgets/functional/level-3/Level3StartWidget.dart';
import 'package:HYPER_SYNK/widgets/functional/login/LoginContainer.dart';
import 'package:flutter/material.dart';

class LevelsWidget extends StatefulWidget {
  final levelsModel;
  final store;

  LevelsWidget({this.levelsModel, this.store});

  LevelsWidgetState createState() =>
      LevelsWidgetState(levelsModel: levelsModel, store: store);
}

class LevelsWidgetState extends State<LevelsWidget> {
  final levelsModel;
  final store;
  LevelsWidgetState({this.levelsModel, this.store});

  onClickOfLogout(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginContainer()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  'TYPO BEATS',
                  style: Theme.of(context).textTheme.headline4,
                )),
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
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            width: 300,
                            child: Image.asset(
                              'car2.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                              width: 150,
                              child: RaisedButton(
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
                                          'Level 1',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Icon(
                                          Icons.play_arrow,
                                          size: 20,
                                        )
                                      ],
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Level1StartWidget(store: store),
                                      ));
                                },
                              ))
                        ],
                      ),
                    )),
                Flexible(
                    flex: 3,
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            width: 300,
                            child: Image.asset(
                              'ball.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                              width: 150,
                              child: RaisedButton(
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
                                          'Level 2',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Icon(
                                          Icons.play_arrow,
                                          size: 20,
                                        )
                                      ],
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Level2StartWidget(store: store),
                                      ));
                                },
                              ))
                        ],
                      ),
                    )),
                Flexible(
                    flex: 3,
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            width: 300,
                            child: Image.asset(
                              'car.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                              width: 150,
                              child: RaisedButton(
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
                                          'Level 3',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Icon(
                                          Icons.play_arrow,
                                          size: 20,
                                        )
                                      ],
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Level3StartWidget(store: store),
                                      ));
                                },
                              ))
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

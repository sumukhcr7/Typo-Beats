import 'package:HYPER_SYNK/widgets/functional/login/LoginContainer.dart';
import 'package:flutter/material.dart';

class Level1StartWidget extends StatefulWidget {
  final levelsModel;
  final store;

  Level1StartWidget({this.levelsModel, this.store});

  Level1StartWidgetState createState() =>
      Level1StartWidgetState(levelsModel: levelsModel, store: store);
}

class Level1StartWidgetState extends State<Level1StartWidget> {
  final levelsModel;
  final store;
  Level1StartWidgetState({this.levelsModel, this.store});

  onClickOfLogout(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginContainer()),
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
                      height: 300,
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
                                "Level 1",
                                style: Theme.of(context).textTheme.headline5,
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 16, bottom: 24, left: 8, right: 8),
                              child: Text(
                                "INSTRUCTIONS: Type the words given to win the race and to avoid obstacles coming.",
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
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
                                  // onClickOfLogout(context);
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
    ));
  }
}

import 'package:HYPER_SYNK/widgets/functional/levels/Level3PlayArea.dart';
import 'package:HYPER_SYNK/widgets/functional/levels/LevelsWidget.dart';
import 'package:HYPER_SYNK/widgets/functional/login/LoginWidget.dart';
import 'package:flutter/material.dart';

class Level3StartWidget extends StatefulWidget {


  Level3StartWidgetState createState() =>
      Level3StartWidgetState();
}

class Level3StartWidgetState extends State<Level3StartWidget> {
  var radioValue;
  var level;
  var widthFrom;
  onClickOfLogout(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginWidget()),
        (Route<dynamic> route) => false);
  }
  void _handleRadioValueChange(int value) {
    setState(() {
      radioValue=value;
    });
    switch (value) {
      case 0:
        level=1;
        widthFrom =450;
        break;
      case 1:
        level=2;
        widthFrom =700;
        break;
      case 2:
        level=3;
        widthFrom =1200;
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
                                "Play with sentences",
                                style: Theme.of(context).textTheme.headline5,
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 16, bottom: 24, left: 8, right: 8),
                              child: Text(
                                "INSTRUCTIONS: Type the sentences given in the box and get the score",
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
                                      'Level 1 (contains around 50 words)',
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
                                      'Level 2 (contains around 100 words)',
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
                                      'Level 3 (contains around 150 words)',
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
                                onPressed:level!=null?(){
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Level3PlayArea(level:level, widthFrom:widthFrom),
                                      ));
                                      }:null,
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

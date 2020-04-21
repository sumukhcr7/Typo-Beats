import 'package:HYPER_SYNK/widgets/functional/levels/LevelsWidget.dart';
import 'package:flutter/material.dart';



class LoginWidget extends StatefulWidget {


  LoginWidgetState createState() =>
      LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  var userName;
  var password;

  handleChange(text, valueType) {
    if (valueType == "userName") {
      setState(() {
        userName = text;
      });
    } else {
      setState(() {
        password = text;
      });
    }
  }

  onClickOfLogin(context) {
    // if (userName == "admin" && password == "admin") {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LevelsWidget(),
          ));
    // } else {
      // getSnackBar(context, "Please enter the correct credentials");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Row(children: <Widget>[
      Container(
        decoration: BoxDecoration(color:Colors.white),
        width: MediaQuery.of(context).size.width/2.5,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'TYPO BEATS',
                style: Theme.of(context).textTheme.headline4,
              ),
              Container(
                  height: MediaQuery.of(context).size.height/1.5 ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                            onChanged: (text) {
                              handleChange(text, 'userName');
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    width: 1,
                                    // style: BorderStyle.none,
                                  ),
                                ),
                                // filled: true,
                                // fillColor: new Color(0xff866DEC),
                                prefixIcon:
                                    Icon(Icons.person, color: Colors.black),
                                hintText: "User name",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 14))),
                      ),
                      SizedBox(
                          width: 300,
                          height: 50,
                          child: TextField(
                              onChanged: (text) {
                                handleChange(text, 'password');
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      width: 1,
                                      // style: BorderStyle.none,
                                    ),
                                  ),
                                  // filled: true,
                                  // fillColor: new Color(0xff866DEC),
                                  prefixIcon: Icon(Icons.lock_open,
                                      color: Colors.black),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 14)))),
                      SizedBox(
                          width: 180,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0)),
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
                                      'Login',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Icon(
                                      Icons.lock_outline,
                                      size: 16,
                                    )
                                  ],
                                )),
                            onPressed: () {
                              onClickOfLogin(context);
                            },
                          )),
                    ],
                  ))
            ],
          )),
      Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width /1.67,
          child: Image.asset('typing2.jpg',fit: BoxFit.cover,)),
    ]));
  }
}

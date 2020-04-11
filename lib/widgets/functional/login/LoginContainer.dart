import 'package:HYPER_SYNK/store/AppState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'LoginWidget.dart';

class LoginContainer extends StatefulWidget {
  final store;
  LoginContainer({this.store});

  @override
  LoginContainerState createState() => LoginContainerState(store: store);
}

class LoginContainerState extends State<LoginContainer> {
  final store;
  LoginContainerState({this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: new StoreConnector<AppState, LoginModel>(
          converter: (store) => LoginModel.fromStore(store),
          builder: (context, loginModel) =>
              LoginWidget(store: store, loginModel: loginModel)),
    ));
  }
}

class LoginModel {
  final user;
  LoginModel({this.user});

  static LoginModel fromStore(Store<AppState> store) {
    return LoginModel(
      user: {}
    );
  }
}

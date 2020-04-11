import 'package:HYPER_SYNK/store/AppState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'LevelsWidget.dart';

class LevelListContainer extends StatefulWidget {
  final store;
  LevelListContainer({this.store});

  @override
  LoginContainerState createState() => LoginContainerState(store: store);
}

class LoginContainerState extends State<LevelListContainer> {
  final store;
  LoginContainerState({this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: new StoreConnector<AppState, LevelsModel>(
          converter: (store) => LevelsModel.fromStore(store),
          builder: (context, levelsModel) =>
              LevelsWidget(store: store, levelsModel: levelsModel)),
    ));
  }
}

class LevelsModel {
  final user;
  LevelsModel({this.user});

  static LevelsModel fromStore(Store<AppState> store) {
    return LevelsModel(
      user: {}
    );
  }
}

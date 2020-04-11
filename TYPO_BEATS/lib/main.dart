import 'package:HYPER_SYNK/store/AppState.dart';
import 'package:HYPER_SYNK/theme/Theme.dart';
import 'package:HYPER_SYNK/widgets/functional/login/LoginContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './store/MainReducer.dart' as MainReducer;

Future<void> main() async {
  final storeInstance = await MainReducer.initializeStore();
  runApp(new TypoBeatsApplication(storeInstance));
}

class TypoBeatsApplication extends StatelessWidget {
  final store;
  TypoBeatsApplication(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: colorPalatte(),
        debugShowCheckedModeBanner: false,
        home: LoginContainer(store: store)
      ),
    );
  }
}
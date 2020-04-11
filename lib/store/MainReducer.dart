import 'package:HYPER_SYNK/store/AppState.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';


Future<Store<AppState>> initializeStore () async{
  final store = new Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware],
  );
  return store;
}
AppState appReducer(AppState state, dynamic action) =>
    new AppState();
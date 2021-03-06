import 'dart:async';
import 'package:github_smaple/redux/app_reducers.dart';
import 'package:github_smaple/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

Future<Store<AppState>> createStore() async {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware],
  );
}

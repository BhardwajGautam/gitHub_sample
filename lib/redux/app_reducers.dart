import 'package:github_smaple/redux/app_state.dart';
import 'package:github_smaple/screens/home/home_reducer.dart';

AppState appReducer(AppState state, dynamic action) => new AppState(
      homeState: homeReducers(state.homeState, action),
    );

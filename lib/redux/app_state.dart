import 'package:github_smaple/screens/home/home_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {

  final HomeState homeState;

  AppState({
    @required this.homeState,
  });

  factory AppState.initial(){
    return AppState(
      homeState: HomeState.initial(),
    );
  }

  AppState copyWith({
    HomeState homeState,
  }){
    return AppState(
      homeState: homeState ?? this.homeState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              homeState == other.homeState;

  @override
  int get hashCode =>
      homeState.hashCode;

}
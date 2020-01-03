



import 'package:github_smaple/screens/home/home_actions.dart';
import 'package:github_smaple/screens/home/home_state.dart';

HomeState homeReducers(HomeState state, dynamic action) {
  if(action is FetchAllCommits) {
    return new HomeState(
      allCommits: action.allCommits,
      fetchError: false,
      isLoading: false,
      isLoadMore: false
    );
  } else if(action == Action.StartLoading) {
    return new HomeState(
      allCommits: state.allCommits,
      fetchError: false,
      isLoading: true,
      isLoadMore: false
    );
  } else if(action == Action.StopLoading) {
    return new HomeState(
      allCommits: state.allCommits,
      fetchError: false,
      isLoading: false,
      isLoadMore: false
    );
  }
  return state;
}
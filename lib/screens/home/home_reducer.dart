



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
  }
  return state;
}
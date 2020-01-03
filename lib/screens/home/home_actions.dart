import 'package:dio/dio.dart';
import 'package:github_smaple/modals/commit_modal.dart';
import 'package:github_smaple/services/constants.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction getAllCommits() {
  return (Store store) async {
    try {
      store.dispatch(Action.StartLoading);
      var dio = new Dio();

      Response response = await dio.get(kBaseUrl);

      List result = response.data;
      if (response.statusCode == 200 && result.length > 0) {
        List commitList = result;
        List<CommitModal> finalResult = [];

        if (commitList != null && commitList.length > 0) {
          commitList.forEach((commit) {
            finalResult.add(CommitModal.fromJson(commit));
          });
        }

        store.dispatch(new FetchAllCommits(finalResult));
        store.dispatch(Action.StopLoading);
      } else {
        store.dispatch(Action.StopLoading);
      }
    } on DioError catch (e) {
      store.dispatch(Action.StopLoading);
      print('error: $e');
    }
  };
}

enum Action {
  StartLoading,
  StopLoading,
  StartLoadMore,
  StopLoadMore,
  FetchError
}

class FetchAllCommits {
  List<CommitModal> _allCommits;
  List<CommitModal> get allCommits => this._allCommits;
  FetchAllCommits(this._allCommits);
}

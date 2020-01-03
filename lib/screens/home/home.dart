import 'package:flutter/material.dart';
import 'package:github_smaple/modals/commit_modal.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_smaple/redux/app_state.dart';
import 'package:github_smaple/screens/home/commit_item.dart';
import 'package:github_smaple/screens/home/home_actions.dart';
import 'package:github_smaple/screens/home/home_state.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Commits"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StoreConnector<AppState, Function>(
              converter: (store) => () {
                store.dispatch(getAllCommits());
              },
              builder: (_, refetchCommits) {
                return InkWell(
                    onTap: () {
                      refetchCommits();
                    },
                    child: Icon(Icons.refresh));
              },
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          StoreConnector<AppState, HomeState>(
            onInit: (store) => store.dispatch(getAllCommits()),
            converter: (store) => store.state.homeState,
            builder: (_, viewModel) {
              List<CommitModal> items = viewModel.allCommits;
              if (viewModel.isLoading == true) {
                return Container(
                  height: 150,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Flexible(
                  child: ListView.builder(
                    itemCount: items.length + 2,
                    itemBuilder: (BuildContext context, int index) {
                      if (items.length <= 0 && viewModel.fetchError) {
                        return _renderError();
                      } else if (index > 0 && index <= items.length) {
                        CommitModal item = items[index - 1];
                        return CommitItem(
                          commitDetail: item,
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _renderError() {
    return Container(
      height: 350,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error while fetching commits\nPlease try again',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            StoreConnector<AppState, Function>(
              converter: (store) => () {
                store.dispatch(getAllCommits());
              },
              builder: (_, callback) {
                return FlatButton(
                  onPressed: () {
                    callback();
                  },
                  child: Text(
                    'Retry',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

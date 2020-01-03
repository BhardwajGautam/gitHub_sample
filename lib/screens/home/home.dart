import 'package:flutter/material.dart';
import 'package:github_smaple/modals/commit_modal.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_smaple/redux/app_state.dart';
import 'package:github_smaple/screens/home/commit_item.dart';
import 'package:github_smaple/screens/home/home_actions.dart';
import 'package:github_smaple/screens/home/home_state.dart';


class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Commits"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StoreConnector<AppState, HomeState>(
              rebuildOnChange: true,
              onInit: (store) => store.dispatch(getAllCommits()),
              converter: (store) => store.state.homeState,
              builder: (_, viewModel) {
                List<CommitModal> items = viewModel.allCommits;
                return Flexible(
                  child: ListView.builder(
                    itemCount: items.length + 2,
                    itemBuilder: (BuildContext context, int index) {
                      if( items.length <= 0 && viewModel.isLoading == true) {
                        return Container(height: 150, child: Center(child: CircularProgressIndicator(),));
                      } else if(items.length <= 0 && viewModel.fetchError){
                        return _renderError();
                      } else if( index > 0 && index <= items.length) {
                        CommitModal item = items[index - 1];
                        return CommitItem(
                          commit: item,
                          
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _renderError(){
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
              converter: (store) => (){
                store.dispatch(getAllCommits());
              },
              builder: (_, callback){
                return FlatButton(
                  onPressed: (){
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
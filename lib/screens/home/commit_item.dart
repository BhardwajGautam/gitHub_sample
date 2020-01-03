import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_smaple/modals/commit_modal.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CommitItem extends StatelessWidget {
  CommitItem({this.commit});
  final CommitModal commit;

  Widget _renderCommitter(context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Row(
        children: [
          Image(
            image: CachedNetworkImageProvider(commit.committer.avatar_url,),
            height: 30,
            width: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              commit.committer.login,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderTitle(context) {
    return GestureDetector(
      onTap: () {
        // .sha.substring(0,7)
      },
      child: Text(
        commit.commit.message,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 90,
      decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          width: 0.5,
        ),
      ),
    ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _renderTitle(context),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: _renderCommitter(context),
          ),
        ],
      ),
    );
  }
}
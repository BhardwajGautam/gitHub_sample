import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_smaple/modals/commit_modal.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CommitItem extends StatelessWidget {
  CommitItem({this.commit});
  final CommitModal commit;

  Widget _renderImage(context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        height: 216,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 17, vertical: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: CachedNetworkImageProvider(commit.id.toString(),),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _renderTitle(context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Text(
          commit.id ?? "hey",
          style: TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // _renderImage(context),
        _renderTitle(context),
      ],
    );
  }
}
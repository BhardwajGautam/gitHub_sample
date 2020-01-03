import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:github_smaple/modals/commit_modal.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CommitItem extends StatelessWidget {
  CommitItem({this.commitDetail});
  final CommitModal commitDetail;

  Widget _renderCommitter(context) {
    String commitDate = commitDetail.commit.author.date;
    var formatter = new DateFormat('MMM dd, yyyy');
    String formatted = formatter.format(DateTime.parse(commitDate));

    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Image(
            image: CachedNetworkImageProvider(
              commitDetail.committer.avatar_url,
            ),
            height: 25,
            width: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              commitDetail.committer.login,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "commited on " + formatted,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            commitDetail.commit.message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Text(
          commitDetail.sha.substring(0, 7),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.blueAccent),
          textAlign: TextAlign.left,
        ),
      ],
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

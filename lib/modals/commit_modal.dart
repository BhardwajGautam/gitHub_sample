import 'package:github_smaple/modals/commiter.dart';

class CommitModal {
  
  String sha;
  String node_id;
  String html_url;
  String url;
  String comments_url;
  Committer committer;
  Commit commit;


  CommitModal({
    this.sha,
    this.node_id,
    this.url,
    this.comments_url,
    this.html_url,
    this.committer,
    this.commit
  });

  factory CommitModal.fromJson(Map<String, dynamic> json) {

    Committer committer = Committer.fromJson(json['committer']);
    Commit commit = Commit.fromJson(json['commit']);

    return CommitModal(
        sha: json['sha'],
        node_id: json['node_id'],
        url: json['url'],
        comments_url: json['comments_url'],
        html_url: json['html_url'],
        committer: committer,
        commit: commit
    );
  }

}

class Commit {
  
  String message;
  int comment_count;
  String commit;
  String html_url;
  String url;
  String comments_url;
  Author author;


  Commit({
    this.message,
    this.comment_count,
    this.url,
    this.comments_url,
    this.html_url,
    this.author
  });

  factory Commit.fromJson(Map<String, dynamic> json) {

    Author author = Author.fromJson(json['author']);
    
    return Commit(
        message: json['message'],
        comment_count: json['comment_count'],
        url: json['url'],
        comments_url: json['comments_url'],
        html_url: json['html_url'],
        author: author
    );
  }

}

class Author {
  
  String name;
  String email;
  String date;


  Author({
    this.name,
    this.email,
    this.date,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    
    return Author(
        name: json['name'],
        email: json['email'],
        date: json['date']
    );
  }

}
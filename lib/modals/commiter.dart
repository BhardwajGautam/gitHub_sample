class Committer {
  int id;
  String login;
  String node_id;
  String avatar_url;
  String gravatar_id;
  String url;
  String html_url;
  String followers_url;
  String following_url;
  String gists_url;
  String starred_url;
  String subscriptions_url;
  String organizations_url;
  String repos_url;
  String events_url;
  String received_events_url;
  String type;
  bool site_admin;

  Committer(
    this.id,
    this.login,
    this.node_id,
    this.avatar_url,
    this.gravatar_id,
    this.url,
    this.html_url,
    this.followers_url,
    this.following_url,
    this.gists_url,
    this.starred_url,
    this.subscriptions_url,
    this.organizations_url,
    this.repos_url,
    this.events_url,
    this.received_events_url,
    this.type,
    this.site_admin,
  );

  Committer.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        login = json['login'],
        node_id = json['node_id'],
        avatar_url = json['avatar_url'],
        gravatar_id = json['gravatar_id'],
        url = json['url'],
        html_url = json['html_url'],
        followers_url = json['followers_url'],
        following_url = json['following_url'],
        gists_url = json['gists_url'],
        starred_url = json['starred_url'],
        subscriptions_url = json['subscriptions_url'],
        organizations_url = json['organizations_url'],
        repos_url = json['repos_url'],
        events_url = json['events_url'],
        received_events_url = json['received_events_url'],
        type = json['type'],
        site_admin = json['site_admin'];
}

import 'dart:convert';

class NewsList {
  NewsList({
    this.status,
    this.totalResults,
    this.articles,
  });

  final String status;
  final int totalResults;
  final List<Article> articles;

  factory NewsList.fromRawJson(String str) =>
      NewsList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsList.fromJson(Map<String, dynamic> json, [String lable]) =>
      NewsList(
        status: json["status"] == null ? null : json["status"],
        totalResults:
            json["totalResults"] == null ? null : json["totalResults"],
        articles: json["articles"] == null
            ? null
            : List<Article>.from(
                json["articles"].map((x) => Article.fromJson(x, lable))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "totalResults": totalResults == null ? null : totalResults,
        "articles": articles == null
            ? null
            : List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.lable,
  });

  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;
  final String lable;

  factory Article.fromRawJson(String str) => Article.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Article.fromJson(Map<String, dynamic> json, [String lable]) =>
      Article(
        author: json["author"] == null ? null : json["author"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        url: json["url"] == null ? null : json["url"],
        urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        content: json["content"] == null ? null : json["content"],
        lable: json["lable"] ?? lable,
      );

  Map<String, dynamic> toJson() => {
        "author": author == null ? null : author,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "url": url == null ? null : url,
        "urlToImage": urlToImage == null ? null : urlToImage,
        "publishedAt":
            publishedAt == null ? null : publishedAt.toIso8601String(),
        "content": content == null ? null : content,
        "lable": lable == null ? null : lable,
      };
}

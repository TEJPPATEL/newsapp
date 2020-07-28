class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  bool isFavourite;

  Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.isFavourite = false});

  factory Article.fromJSON(Map<String, dynamic> json) {
    // source = Source.fromJSON(json["source"]),
    return Article(
        source: Source.fromJSON(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
        content: json["content"]);
  }

  // toggleFavourite() {
  //   isFavourite = !isFavourite;
  //   notifyListeners();
  // }
}

class Source {
  String id;
  String name;

  Source({this.id, this.name});

  factory Source.fromJSON(Map<String, dynamic> json) {
    return Source(id: json["id"], name: json["name"]);
  }
}

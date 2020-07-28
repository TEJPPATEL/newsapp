import 'dart:convert';
import 'global.dart';
import 'models/article.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> getTopHeadLines() async {
  var response = await http.get(TOP_HEADLINE);

  if (response.statusCode == 200) {
    print("GET TOP HEADLINE");
    final resArticles = json.decode(response.body)["articles"] as List;
    List<Article> articles =
        resArticles.map((element) => Article.fromJSON(element)).toList();
    return articles;
  }
}

Future<List<Article>> getTopHeadLinesWithCategory(String category) async {
  var response = await http.get(categoryWiseSearch(category));
  if (response.statusCode == 200) {
    print("GET TOP HEADLINE WITH CATEGORY");
    final resArticles = json.decode(response.body)["articles"] as List;
    List<Article> articles =
        resArticles.map((element) => Article.fromJSON(element)).toList();
    print(articles);
    return articles;
  }
}

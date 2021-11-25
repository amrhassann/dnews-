import 'dart:convert';
import 'dart:async';
import 'package:dnews/models/Article.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  Map<String, String> headers = {
    'accept':
        'application/json', // that is not important in request but its ok to use
  };


  Future<List<Article>> fetchArticle({int? page  , String? category , country}) async {
    String news =
        'https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=ff978dce03944637884fe011dd70db94&page=' +
            page.toString();
    http.Response response = await http.get(Uri.parse(news), headers: headers);

    if (response.statusCode != 200) {
      print('status code = ${response.statusCode}');
    }

    var body = jsonDecode(response.body); // body of api
    var jsonArticles = body['articles'] as List;
    var articles = jsonArticles.map((e) => Article.fromjson(e)).toList();

    return articles;
  }
}

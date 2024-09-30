import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jamm_news_app/utils/app_constants.dart';
import 'package:jamm_news_app/model/article.dart';

class DataProvider {

  final endPointUrl = AppConstants.baseUrl;
  final path = AppConstants.path;
  final client = http.Client();

  Future<List<Article>> getArticles(String categoryName, String country) async {
    Map<String, String> queryParameters = {'country': 'us'};

    if (categoryName !=  AppConstants.categoryAll) {
      queryParameters['category'] = categoryName;
    }

    queryParameters['apiKey'] = AppConstants.apiKey;
    try {
      final uri = Uri.https(endPointUrl, path, queryParameters);
      final response = await client.get(uri);

      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<Article> articles = [];

      articles = body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } catch (e) {
      throw ("$e");
    }
  }
}

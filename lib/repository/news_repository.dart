import 'package:jamm_news_app/data_provider/data_provider.dart';
import 'package:jamm_news_app/model/article.dart';

class NewsRepository {
  final DataProvider dataProvider = DataProvider();

  Future<List<Article>> getArticles(String categoryName, String country) async {
    return await dataProvider.getArticles(categoryName, country);
  }
}

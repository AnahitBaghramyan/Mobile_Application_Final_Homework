import 'package:news_app/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<List<Article>> getTopHeadlines({
    required String country,
  });
}

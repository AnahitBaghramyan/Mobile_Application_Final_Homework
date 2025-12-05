import 'package:news_app/data/datasources/news_api_service.dart';
import 'package:news_app/domain/entities/article.dart';
import 'package:news_app/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService apiService;
  final String apiKey;

  ArticleRepositoryImpl({
    required this.apiService,
    required this.apiKey,
  });

  @override
  Future<List<Article>> getTopHeadlines({required String country}) async {
    try {
      final response = await apiService.getTopHeadlines(
        country: country,
        apiKey: apiKey,
      );
      return response.articles.map((model) => model.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }
}

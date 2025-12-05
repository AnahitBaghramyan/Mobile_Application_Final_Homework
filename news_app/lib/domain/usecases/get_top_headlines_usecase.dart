import 'package:news_app/domain/entities/article.dart';
import 'package:news_app/domain/repositories/article_repository.dart';

class GetTopHeadlinesUseCase {
  final ArticleRepository repository;

  GetTopHeadlinesUseCase({required this.repository});

  Future<List<Article>> call({required String country}) {
    return repository.getTopHeadlines(country: country);
  }
}

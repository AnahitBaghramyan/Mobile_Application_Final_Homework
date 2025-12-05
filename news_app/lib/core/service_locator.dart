import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/data/datasources/news_api_service.dart';
import 'package:news_app/data/repositories/article_repository_impl.dart';
import 'package:news_app/domain/repositories/article_repository.dart';
import 'package:news_app/domain/usecases/get_top_headlines_usecase.dart';
import 'package:news_app/presentation/bloc/news_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Environment
  final apiKey = dotenv.env['NEWS_API_KEY'] ?? '';

  // Dio
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  // Data sources
  getIt.registerSingleton<NewsApiService>(
    NewsApiService(dio),
  );

  // Repositories
  getIt.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(
      apiService: getIt<NewsApiService>(),
      apiKey: apiKey,
    ),
  );

  // Use cases
  getIt.registerSingleton<GetTopHeadlinesUseCase>(
    GetTopHeadlinesUseCase(repository: getIt<ArticleRepository>()),
  );

  // BLoC
  getIt.registerSingleton<NewsBloc>(
    NewsBloc(getTopHeadlinesUseCase: getIt<GetTopHeadlinesUseCase>()),
  );
}

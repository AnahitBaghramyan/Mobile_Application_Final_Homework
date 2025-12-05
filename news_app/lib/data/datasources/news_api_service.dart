import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:news_app/data/models/news_response.dart';

part 'news_api_service.g.dart';

@RestApi()
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String? baseUrl}) = _NewsApiService;

  @GET('/v2/top-headlines')
  Future<NewsResponse> getTopHeadlines({
    @Query('country') required String country,
    @Query('apiKey') required String apiKey,
  });
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/domain/usecases/get_top_headlines_usecase.dart';
import 'package:news_app/presentation/bloc/news_event.dart';
import 'package:news_app/presentation/bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetTopHeadlinesUseCase getTopHeadlinesUseCase;

  NewsBloc({required this.getTopHeadlinesUseCase}) : super(const NewsInitial()) {
    on<FetchTopHeadlinesEvent>(_onFetchTopHeadlines);
  }

  Future<void> _onFetchTopHeadlines(
    FetchTopHeadlinesEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(const NewsLoading());
    try {
      final articles = await getTopHeadlinesUseCase(country: event.country);
      emit(NewsLoaded(articles: articles));
    } catch (e) {
      emit(NewsError(message: e.toString()));
    }
  }
}

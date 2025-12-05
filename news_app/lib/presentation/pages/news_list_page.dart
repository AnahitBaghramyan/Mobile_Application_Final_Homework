import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/bloc/news_bloc.dart';
import 'package:news_app/presentation/bloc/news_event.dart';
import 'package:news_app/presentation/bloc/news_state.dart';
import 'package:news_app/presentation/widgets/article_card.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(
          const FetchTopHeadlinesEvent(country: 'us'),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B3D2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B3D2E),
        elevation: 0,
        title: const Text(
          'Top Headlines',
          style: TextStyle(
            color: Color(0xFFE8DCC8),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF7BA494),
              ),
            );
          }

          if (state is NewsLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return ArticleCard(article: state.articles[index]);
              },
            );
          }

          if (state is NewsError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 48,
                    color: Color(0xFFD4AF89),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${state.message}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFFE8DCC8),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A5C4A),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      context.read<NewsBloc>().add(
                            const FetchTopHeadlinesEvent(country: 'us'),
                          );
                    },
                    child: const Text(
                      'Retry',
                      style: TextStyle(
                        color: Color(0xFFE8DCC8),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

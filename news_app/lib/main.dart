import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/core/service_locator.dart';
import 'package:news_app/presentation/bloc/news_bloc.dart';
import 'package:news_app/presentation/pages/news_list_page.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: BlocProvider<NewsBloc>(
        create: (context) => getIt<NewsBloc>(),
        child: const NewsListPage(),
      ),
    );
  }
}

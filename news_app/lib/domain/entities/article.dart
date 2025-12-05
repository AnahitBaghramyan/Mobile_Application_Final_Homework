import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String description;
  final String? imageUrl;
  final String source;
  final String? author;
  final String? content;
  final String? url;
  final DateTime publishedAt;

  const Article({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.source,
    this.author,
    this.content,
    this.url,
    required this.publishedAt,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    imageUrl,
    source,
    author,
    content,
    url,
    publishedAt,
  ];
}

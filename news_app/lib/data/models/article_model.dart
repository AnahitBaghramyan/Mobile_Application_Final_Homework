import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/domain/entities/article.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  final Source source;
  final String? author;
  final String title;
  final String? description;
  final String? url;
  @JsonKey(name: 'urlToImage')
  final String? urlToImage;
  final String publishedAt;
  final String? content;

  ArticleModel({
    required this.source,
    this.author,
    required this.title,
    this.description,
    this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

  Article toEntity() {
    return Article(
      id: url ?? title,
      title: title,
      description: description ?? '',
      imageUrl: urlToImage,
      source: source.name,
      author: author,
      content: content,
      url: url,
      publishedAt: DateTime.parse(publishedAt),
    );
  }
}

@JsonSerializable()
class Source {
  final String? id;
  final String name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) =>
      _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

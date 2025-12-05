import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchTopHeadlinesEvent extends NewsEvent {
  final String country;

  const FetchTopHeadlinesEvent({required this.country});

  @override
  List<Object> get props => [country];
}

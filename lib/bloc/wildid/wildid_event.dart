part of 'wildid_bloc.dart';

abstract class WildidEvent extends Equatable {
  const WildidEvent();
}

class LoadWildidApiEvent extends WildidEvent {
  @override
  List<Object?> get props => [];
}

class InputSearchEvent extends WildidEvent {
  final String status;
  final String text;
  final List<Article> articles;

  InputSearchEvent(
      {required this.status, required this.text, required this.articles});

  @override
  List<Object?> get props => [text];
}

class NoConnectionEvent extends WildidEvent {
  @override
  List<Object?> get props => [];
}

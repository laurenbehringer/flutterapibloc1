part of 'wildid_bloc.dart';

abstract class WildidState extends Equatable {
  const WildidState();
}

class WildidInitial extends WildidState {
  @override
  List<Object> get props => [];
}

class WildidLoadingState extends WildidState {
  @override
  List<Object> get props => [];
}

class WildidLoadedState extends WildidState{
  final String status;
  final List<Article> articles;
  final List<Article> displayarticle_list;
  final bool isSearch;

  WildidLoadedState({this.status = '', required this.articles, this.displayarticle_list = const [], this.isSearch = false});

  @override
  List<Object?> get props => [status, articles, displayarticle_list, isSearch];
}

class WildidLoadFailedState extends WildidState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WildidNoConnectionState extends WildidState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
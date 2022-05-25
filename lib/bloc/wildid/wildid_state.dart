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

  WildidLoadedState(this.status, this.articles);

  @override
  List<Object?> get props => [status, articles];
}

class WildidNoConnectionState extends WildidState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
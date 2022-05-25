part of 'wildid_bloc.dart';

abstract class WildidEvent extends Equatable {
  const WildidEvent();
}

class LoadWildidApiEvent extends WildidEvent{
  @override
  List<Object?> get props => [];
}

class NoConnectionEvent extends  WildidEvent{
  @override
  List<Object?> get props => [];
}
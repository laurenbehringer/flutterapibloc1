part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadActivityApiEvent extends HomeEvent{
  @override
  List<Object?> get props => [];
}

class NoConnectionEvent extends  HomeEvent{
  @override
  List<Object?> get props => [];

}
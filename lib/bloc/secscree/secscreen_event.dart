part of 'secscreen_bloc.dart';

abstract class SecscreenEvent extends Equatable {
  const SecscreenEvent();
}

class LoadingSecScreenEvent extends SecscreenEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadSecscreenEvent extends SecscreenEvent{
  final int number;

  LoadSecscreenEvent(this.number);
  @override
  List<Object?> get props => [number];
}


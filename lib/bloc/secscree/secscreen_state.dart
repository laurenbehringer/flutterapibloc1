part of 'secscreen_bloc.dart';

abstract class SecscreenState extends Equatable {
  const SecscreenState();
}

class SecscreenInitial extends SecscreenState {
  @override
  List<Object> get props => [];
}

class SecScreenLoadingState extends SecscreenState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SecScreenLoadedState extends SecscreenState {
  final int number;
  SecScreenLoadedState(this.number);

  @override
  List<Object?> get props => [number];
}

class SecScreenLoadContactState extends SecscreenState {
  final List<Contact> item;
  SecScreenLoadContactState(this.item);

  @override
  List<Object?> get props => [item];
}

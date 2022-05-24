part of 'buttontxt_bloc.dart';

abstract class ButtontxtEvent extends Equatable {
  const ButtontxtEvent();
}

class LoadButtontxtEvent extends ButtontxtEvent{
  @override
  List<Object?> get props => [];
}

class Increment extends ButtontxtEvent {
  final int number;
  Increment(this.number);

  @override
  List<Object> get props => [number];
}
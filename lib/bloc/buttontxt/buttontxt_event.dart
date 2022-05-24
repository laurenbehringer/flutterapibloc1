part of 'buttontxt_bloc.dart';

abstract class ButtontxtEvent extends Equatable {
  const ButtontxtEvent();
}

class LoadButtontxtEvent extends ButtontxtEvent{
  final int number;
  LoadButtontxtEvent(this.number);
  @override
  List<Object?> get props => [number];
}

class Increment extends ButtontxtEvent {
  final int number;
  Increment(this.number);

  @override
  List<Object> get props => [number];
}
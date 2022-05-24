part of 'buttontxt_bloc.dart';

abstract class ButtontxtState extends Equatable {
  const ButtontxtState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ButtontxtInitialState extends ButtontxtState {
  @override
  List<Object> get props => [];
}

class ButtonTxtLoadingState extends ButtontxtState {
  final int number;

  ButtonTxtLoadingState({
    required this.number,
  });

  @override
  List<Object> get props => [number];
}

class IncrementSuccessState extends ButtontxtState {
  final int number;

  IncrementSuccessState({
    required this.number,
  });

  @override
  List<Object> get props => [number];
}

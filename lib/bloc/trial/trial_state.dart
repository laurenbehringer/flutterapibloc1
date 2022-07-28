part of 'trial_bloc.dart';

abstract class TrialState extends Equatable {
  const TrialState();
}

class TrialInitial extends TrialState {
  @override
  List<Object> get props => [];
}

class ChangeSliderValState extends TrialState{

  final double value;
  ChangeSliderValState(this.value);

  @override
  List<Object?> get props => [value];
}

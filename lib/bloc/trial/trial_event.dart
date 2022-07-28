part of 'trial_bloc.dart';

abstract class TrialEvent extends Equatable {
  const TrialEvent();
}

class ChangeSliderEvent extends TrialEvent{
  final double value;

  ChangeSliderEvent(this.value);
  @override
  List<Object?> get props => [value];
}

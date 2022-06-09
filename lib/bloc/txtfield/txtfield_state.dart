part of 'txtfield_bloc.dart';

abstract class TxtfieldState extends Equatable {
  const TxtfieldState();
}

class TxtfieldInitial extends TxtfieldState {
  final String initUsername, initPassword;
  final widget;

  TxtfieldInitial({
    required this.initUsername,
    required this.initPassword,
    required this.widget,
  });

  @override
  List<Object> get props => [initPassword,initUsername, widget];
}

class TxtfieldLoading extends TxtfieldState {
  @override
  List<Object> get props => [];
}

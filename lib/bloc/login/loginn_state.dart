part of 'loginn_bloc.dart';

abstract class LoginnState extends Equatable {
  const LoginnState();
}

class LoginnInitial extends LoginnState {
  @override
  List<Object> get props => [];
}
class LoginnLoading extends LoginnState {
  @override
  List<Object> get props => [];
}

class LoginnLoaded extends LoginnState {

  final Person person;

  LoginnLoaded(this.person);

  @override
  List<Object> get props => [person];
}

part of 'loginn_bloc.dart';

abstract class LoginnEvent extends Equatable {
  const LoginnEvent();
}


class LoadingLoginEvent extends LoginnEvent{
  @override
  List<Object?> get props => [];
}

class LoadedLoginEvent extends LoginnEvent{
  final Person person;
  LoadedLoginEvent(this.person);
  @override
  List<Object?> get props => [person];
}

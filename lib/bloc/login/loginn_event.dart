part of 'loginn_bloc.dart';

abstract class LoginnEvent extends Equatable {
  const LoginnEvent();
}

class LoadingLoginEvent extends LoginnEvent{
  final LoginParameter loginParameter;

  LoadingLoginEvent({required this.loginParameter});

  @override
  List<Object?> get props => [loginParameter];
}

class LoadedLoginEvent extends LoginnEvent{
  @override
  List<Object?> get props => [];
}

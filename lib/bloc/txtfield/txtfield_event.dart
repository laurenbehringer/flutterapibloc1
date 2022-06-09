part of 'txtfield_bloc.dart';

abstract class TxtfieldEvent extends Equatable {
  const TxtfieldEvent();
}

class LoadTxtfieldEvent extends TxtfieldEvent{
  final String username, password;
  final widget;
  LoadTxtfieldEvent(this.username, this.password, this.widget);
  @override
  List<Object?> get props => [username, password,widget];
}

class LoadingTxtfieldEvent extends TxtfieldEvent{
  @override
  List<Object?> get props => [];
}


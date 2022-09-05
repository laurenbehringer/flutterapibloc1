part of 'blackjackk_bloc.dart';

abstract class BlackjackkState extends Equatable {
  const BlackjackkState();
}

class BlackjackkInitial extends BlackjackkState {
  @override
  List<Object> get props => [];
}

class BlackjackkLoad extends BlackjackkState {
  @override
  List<Object> get props => [];
}

class BlackjackkShuffleLoaded extends BlackjackkState {
  BlackJackShuffleResponseModel bjshuffle;
  BlackjackkShuffleLoaded(this.bjshuffle);

  @override
  List<Object> get props => [bjshuffle];
}

class BlackjackkDrawLoaded extends BlackjackkState {
  BlackJackDrawCardResponseModel bjdraw;
  BlackjackkDrawLoaded(this.bjdraw);

  @override
  List<Object> get props => [bjdraw];
}

class BlackjackValueLoaded extends BlackjackkState {
  int dealerVal;
  BlackjackValueLoaded(this.dealerVal);

  @override
  List<Object> get props => [dealerVal];
}

class BustedState extends BlackjackkState {
  @override
  List<Object> get props => [];
}

class StandState extends BlackjackkState {
  @override
  List<Object> get props => [];
}

class WinState extends BlackjackkState {
  @override
  List<Object> get props => [];
}

class LoseState extends BlackjackkState {
  @override
  List<Object> get props => [];
}

class DrawState extends BlackjackkState {
  @override
  List<Object> get props => [];
}

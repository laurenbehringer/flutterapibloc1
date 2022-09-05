part of 'blackjackk_bloc.dart';

abstract class BlackjackkEvent extends Equatable {
  const BlackjackkEvent();
}

class ShuffleCardEvent extends BlackjackkEvent {
  @override
  List<Object?> get props => [];
}

class ResetCardEvent extends BlackjackkEvent {
  @override
  List<Object?> get props => [];
}

class DrawCardEvent extends BlackjackkEvent {
  final String deck_id;
  final String draw_count;

  DrawCardEvent({required this.deck_id, required this.draw_count});

  @override
  List<Object?> get props => [deck_id, draw_count];
}

class AddValEvent extends BlackjackkEvent {
  final int dealerVal;

  AddValEvent({required this.dealerVal});

  @override
  List<Object?> get props => [dealerVal];
}

class BustedEvent extends BlackjackkEvent {
  @override
  List<Object?> get props => [];
}

class StandEvent extends BlackjackkEvent {
  @override
  List<Object?> get props => [];
}

class WinEvent extends BlackjackkEvent {
  @override
  List<Object?> get props => [];
}

class LoseEvent extends BlackjackkEvent {
  @override
  List<Object?> get props => [];
}

class DrawEvent extends BlackjackkEvent {
  @override
  List<Object?> get props => [];
}

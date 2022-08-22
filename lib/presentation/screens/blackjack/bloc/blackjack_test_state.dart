part of 'blackjack_test_bloc.dart';

BlackJackTestParameter parameter = BlackJackTestParameter();

abstract class BlackjackTestState {
  BlackJackTestParameter props = parameter;
}

class BlackjackTestInitial extends BlackjackTestState {}

class BlackjackTestLoad extends BlackjackTestState {}

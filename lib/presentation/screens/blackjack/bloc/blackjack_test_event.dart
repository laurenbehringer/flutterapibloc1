part of 'blackjack_test_bloc.dart';

abstract class BlackjackTestEvent {
  const BlackjackTestEvent();
}

class ShuffleCardTest extends BlackjackTestEvent {}

class DrawCardTest extends BlackjackTestEvent {}

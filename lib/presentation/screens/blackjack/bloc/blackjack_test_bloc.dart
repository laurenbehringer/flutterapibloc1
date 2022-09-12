import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapibloc1/data/models/blackjack/blackjack_draw_responsemodel.dart';
import 'package:flutterapibloc1/data/models/blackjack/blackjack_response_model.dart';
import 'package:flutterapibloc1/data/services/blackjack_service.dart';
import 'package:flutterapibloc1/presentation/screens/blackjack/parameter/blackjack_test_parameter.dart';
import 'package:flutterapibloc1/presentation/utils/soundEffects.dart';

part 'blackjack_test_event.dart';
part 'blackjack_test_state.dart';

class BlackjackTestBloc extends Bloc<BlackjackTestEvent, BlackjackTestState> {
  BlackjackTestBloc() : super(BlackjackTestInitial()) {
    on<BlackjackTestEvent>((event, emit) async {
      if (event is ShuffleCardTest) {
        emit(BlackjackTestLoad());
        final shuffleCards = await BJNetwork.ShuffleCards();
        state.props.shuffleModel =
            BlackJackShuffleResponseModel.fromJson(shuffleCards);
        // print(state.props.shuffleModel!.deckId);
        emit(BlackjackTestInitial());
      }

      if (event is DrawCardTest) {
        emit(BlackjackTestLoad());
        final drawCards = await BJNetwork.DrawCards(
            deck_id: state.props.shuffleModel!.deckId, draw_count: '1');
        SoundEffect.dealCard();
        // BlackJackDrawCardResponseModel model = BlackJackDrawCardResponseModel.fromJson(drawCards);
        // for (int i = 0; i < model.cards.length; i++){
        //   state.props.cards.add(model.cards[i]);
        // }
        state.props.cards
            .addAll(BlackJackDrawCardResponseModel.fromJson(drawCards).cards);
        emit(BlackjackTestInitial());
      }
    });
  }
}

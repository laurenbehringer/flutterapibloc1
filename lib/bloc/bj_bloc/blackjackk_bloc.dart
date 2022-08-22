import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapibloc1/data/models/blackjack/blackjack_draw_responsemodel.dart';
import 'package:flutterapibloc1/data/models/blackjack/blackjack_response_model.dart';
import 'package:flutterapibloc1/data/services/blackjack_service.dart';
import 'package:flutterapibloc1/data/services/network_handler.dart';
import 'package:flutterapibloc1/presentation/utils/soundEffects.dart';

part 'blackjackk_event.dart';
part 'blackjackk_state.dart';

class BlackjackkBloc extends Bloc<BlackjackkEvent, BlackjackkState> {
  BlackjackkBloc() : super(BlackjackkInitial()) {
    on<BlackjackkEvent>((event, emit) async {
      if (event is ShuffleCardEvent) {
        emit(BlackjackkLoad());
        final shuffleCards = await BJNetwork.ShuffleCards();
        print("Cards here ${shuffleCards}");
        emit(BlackjackkShuffleLoaded(
            BlackJackShuffleResponseModel.fromJson(shuffleCards)));
      }

      if (event is DrawCardEvent) {
        //emit(BlackjackkLoad());
        final drawCards = await BJNetwork.DrawCards(
            deck_id: event.deck_id, draw_count: event.draw_count);
        SoundEffect.dealCard();
        print("Drawed Cards here ${drawCards}");
        emit(BlackjackkDrawLoaded(
            BlackJackDrawCardResponseModel.fromJson(drawCards)));
      }

      if (event is AddValEvent) {
        emit(BlackjackValueLoaded(event.dealerVal));
      }
    });
  }
}

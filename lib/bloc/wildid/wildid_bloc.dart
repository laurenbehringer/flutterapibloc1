import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapibloc1/data/models/wildid_api.dart';
import 'package:flutterapibloc1/data/services/wildid_service.dart';

part 'wildid_event.dart';

part 'wildid_state.dart';

class WildidBloc extends Bloc<WildidEvent, WildidState> {
  final WildidService wildidService;

  WildidBloc({required this.wildidService}) : super(WildidInitial()) {
    on<LoadWildidApiEvent>((event, emit) async {
      emit(WildidLoadingState());
      try {
        final wildid = await wildidService.getWildidAPI();
        emit(WildidLoadedState(
            status: wildid.status, articles: wildid.articles));
      } catch (e) {
        emit(WildidLoadFailedState());
      }
    });

    on<InputSearchEvent>((event, emit) {
      List<Article> result = event.articles
          .where((element) =>
              element.title.toLowerCase().contains(event.text.toLowerCase()))
          .toList();
      if (event.text.isNotEmpty) {
        emit(WildidLoadedState(
            articles: event.articles,
            displayarticle_list: result,
            isSearch: true));
      } else {
        emit(WildidLoadedState(articles: event.articles));
      }
    });

    on<NoConnectionEvent>((event, emit) {
      emit(WildidNoConnectionState());
    });
  }
}

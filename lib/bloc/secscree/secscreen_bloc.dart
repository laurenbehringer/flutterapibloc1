import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
part 'secscreen_event.dart';
part 'secscreen_state.dart';

class SecscreenBloc extends Bloc<SecscreenEvent, SecscreenState> {
  SecscreenBloc() : super(SecscreenInitial()) {
    on<LoadSecscreenEvent>((event, emit) {
      emit(SecScreenLoadedState(event.number + 1));
    });

    on<LoadingSecScreenEvent>((event, emit) {
      emit(SecScreenLoadingState());
    });

    on<LoadContactEvent>((event, emit) async {
      emit(SecScreenLoadingState());
      List<Contact> items = [];
      if (await FlutterContacts.requestPermission()) {
        items = await FlutterContacts.getContacts(
            withProperties: true, withPhoto: true);
        print(items);
      }
      emit(SecScreenLoadContactState(items));
    });
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapibloc1/data/models/loginpost.dart';
import 'package:flutterapibloc1/data/services/network_handler.dart';
import 'package:flutterapibloc1/presentation/Paramater/login_parameter.dart';
import 'package:flutterapibloc1/presentation/utils/secure_storage.dart';

part 'loginn_event.dart';
part 'loginn_state.dart';

class LoginnBloc extends Bloc<LoginnEvent, LoginnState> {

  final NetworkHandler networkHandler;

  LoginnBloc({required this.networkHandler}) : super(LoginnInitial()) {
    on<LoginnEvent>((event, emit) async  {
      if (event is LoadingLoginEvent){
        emit(LoginnLoading());
        final person = await NetworkHandler.PostLogin(
          event.loginParameter
        );
        print("printing person Has UserName");
        print(person?.hashUserName);
        SecureStorage().addNewItem('cifNum', person?.hashUserName);
        print("saved");
        emit(LoginnLoaded(person!));
      }
    });
  }
}

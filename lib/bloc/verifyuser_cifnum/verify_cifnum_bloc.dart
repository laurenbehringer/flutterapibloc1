import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapibloc1/data/models/cifnum.dart';
import 'package:flutterapibloc1/data/models/loginpost.dart';
import 'package:flutterapibloc1/data/services/network_handler.dart';

part 'verify_cifnum_event.dart';
part 'verify_cifnum_state.dart';

class VerifyCifnumBloc extends Bloc<VerifyCifnumEvent, VerifyCifnumState> {

  NetworkHandler networkHandler = new NetworkHandler();

  VerifyCifnumBloc() : super(VerifyCifnumInitial()) {
    on<VerifyCifnumEvent>((event, emit) async {

      if (event is LoadingVerifyCifnumEvent){
        emit(VerifyCifnumLoadingState());
        print("rrrrr");
        final userCifnum = await NetworkHandler.PostVerifyUserCifnum();
        print("qqqq");
        print(userCifnum?.fullName);
        emit(VerifyCifnumLoadedState(userCifnum!));
      }

    });
  }
}

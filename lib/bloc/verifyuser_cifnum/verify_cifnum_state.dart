part of 'verify_cifnum_bloc.dart';

abstract class VerifyCifnumState extends Equatable {
  const VerifyCifnumState();
}

class VerifyCifnumInitial extends VerifyCifnumState {
  @override
  List<Object> get props => [];
}

class VerifyCifnumLoadingState extends VerifyCifnumState {
  @override
  List<Object> get props => [];
}

class VerifyCifnumLoadedState extends VerifyCifnumState {
  VerifyUserCifNum verifUserCifNum;
  VerifyCifnumLoadedState(this.verifUserCifNum);

  @override
  List<Object> get props => [verifUserCifNum];
}

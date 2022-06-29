part of 'verify_cifnum_bloc.dart';

abstract class VerifyCifnumEvent extends Equatable {
  const VerifyCifnumEvent();
}

class LoadingVerifyCifnumEvent extends VerifyCifnumEvent{
  @override
  List<Object?> get props => [];
}

class LoadedVerifyCifnumEvent extends VerifyCifnumEvent{
  VerifyUserCifNum userCifnum;
  LoadedVerifyCifnumEvent(this.userCifnum);

  @override
  List<Object?> get props => [userCifnum];
}


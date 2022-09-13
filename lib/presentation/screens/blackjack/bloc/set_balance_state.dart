part of 'set_balance_bloc.dart';

abstract class SetBalanceState extends Equatable {
  const SetBalanceState();
}

class SetBalanceInitial extends SetBalanceState {
  @override
  List<Object> get props => [];
}

class ResetBankrollState extends SetBalanceState {
  final int temp;
  ResetBankrollState(this.temp);
  @override
  List<Object> get props => [temp];
}

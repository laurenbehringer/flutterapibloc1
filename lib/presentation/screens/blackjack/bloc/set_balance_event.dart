part of 'set_balance_bloc.dart';

abstract class SetBalanceEvent extends Equatable {
  const SetBalanceEvent();
}

class ResetBankrollEvent extends SetBalanceEvent {
  final int tempVal;
  ResetBankrollEvent(this.tempVal);
  @override
  // TODO: implement props
  List<Object?> get props => [tempVal];
}

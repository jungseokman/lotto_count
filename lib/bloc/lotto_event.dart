part of 'lotto_bloc.dart';

sealed class LottoEvent extends Equatable {
  const LottoEvent();

  @override
  List<Object> get props => [];
}

class GetRecentRound extends LottoEvent {}

class GetLottoNumber extends LottoEvent {
  const GetLottoNumber({
    required this.recentRound,
  });

  final String recentRound;

  @override
  List<Object> get props => [recentRound];
}

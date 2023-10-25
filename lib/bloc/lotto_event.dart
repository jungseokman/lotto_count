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
    required this.count,
    required this.type,
  });

  final String recentRound;
  final String type;
  final int count;

  @override
  List<Object> get props => [recentRound, type, count];
}

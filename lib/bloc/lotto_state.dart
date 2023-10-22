part of 'lotto_bloc.dart';

enum GetRecentRoundStatus {
  initial,
  loading,
  success,
  failure,
}

class LottoState extends Equatable {
  const LottoState({
    required this.recentRound,
    required this.getRecentRoundStatus,
  });

  final String recentRound;
  final GetRecentRoundStatus getRecentRoundStatus;

  @override
  List<Object> get props => [recentRound, getRecentRoundStatus];

  LottoState copyWith({
    String? recentRound,
    GetRecentRoundStatus? getRecentRoundStatus,
  }) {
    return LottoState(
      recentRound: recentRound ?? this.recentRound,
      getRecentRoundStatus: getRecentRoundStatus ?? this.getRecentRoundStatus,
    );
  }

  @override
  String toString() =>
      'LottoState(recentRound: $recentRound, getRecentRoundStatus: $getRecentRoundStatus)';
}

class LottoInitial extends LottoState {
  const LottoInitial()
      : super(
          recentRound: '',
          getRecentRoundStatus: GetRecentRoundStatus.initial,
        );
}

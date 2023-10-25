part of 'lotto_bloc.dart';

enum GetRecentRoundStatus {
  initial,
  loading,
  success,
  failure,
}

enum GetRecentNumberStatus {
  initial,
  loading,
  success,
  failure,
}

class LottoState extends Equatable {
  const LottoState({
    required this.recentRound,
    required this.getRecentRoundStatus,
    required this.count,
    required this.num1,
    required this.num2,
    required this.num3,
    required this.num4,
    required this.num5,
    required this.num6,
    required this.bonus,
    required this.firstWinamnt,
    required this.getRecentNumberStatus,
  });

  final String recentRound;
  final GetRecentRoundStatus getRecentRoundStatus;
  final int count;
  final String num1;
  final String num2;
  final String num3;
  final String num4;
  final String num5;
  final String num6;
  final String bonus;
  final String firstWinamnt;
  final GetRecentNumberStatus getRecentNumberStatus;

  @override
  List<Object> get props {
    return [
      recentRound,
      getRecentRoundStatus,
      count,
      num1,
      num2,
      num3,
      num4,
      num5,
      num6,
      bonus,
      firstWinamnt,
      getRecentNumberStatus,
    ];
  }

  LottoState copyWith({
    String? recentRound,
    GetRecentRoundStatus? getRecentRoundStatus,
    int? count,
    String? num1,
    String? num2,
    String? num3,
    String? num4,
    String? num5,
    String? num6,
    String? bonus,
    String? firstWinamnt,
    GetRecentNumberStatus? getRecentNumberStatus,
  }) {
    return LottoState(
      recentRound: recentRound ?? this.recentRound,
      getRecentRoundStatus: getRecentRoundStatus ?? this.getRecentRoundStatus,
      count: count ?? this.count,
      num1: num1 ?? this.num1,
      num2: num2 ?? this.num2,
      num3: num3 ?? this.num3,
      num4: num4 ?? this.num4,
      num5: num5 ?? this.num5,
      num6: num6 ?? this.num6,
      bonus: bonus ?? this.bonus,
      firstWinamnt: firstWinamnt ?? this.firstWinamnt,
      getRecentNumberStatus:
          getRecentNumberStatus ?? this.getRecentNumberStatus,
    );
  }

  @override
  String toString() {
    return 'LottoState(recentRound: $recentRound, getRecentRoundStatus: $getRecentRoundStatus, count: $count, num1: $num1, num2: $num2, num3: $num3, num4: $num4, num5: $num5, num6: $num6, bonus: $bonus, firstWinamnt: $firstWinamnt, getRecentNumberStatus: $getRecentNumberStatus)';
  }
}

class LottoInitial extends LottoState {
  const LottoInitial()
      : super(
          recentRound: '',
          getRecentRoundStatus: GetRecentRoundStatus.initial,
          count: 1,
          num1: '',
          num2: '',
          num3: '',
          num4: '',
          num5: '',
          num6: '',
          bonus: '',
          firstWinamnt: '',
          getRecentNumberStatus: GetRecentNumberStatus.initial,
        );
}

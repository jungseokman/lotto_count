import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lotto_web/service/lotto_api_service.dart';

part 'lotto_event.dart';
part 'lotto_state.dart';

class LottoBloc extends Bloc<LottoEvent, LottoState> {
  LottoBloc() : super(const LottoInitial()) {
    final service = LottoApiService();

    on<GetRecentRound>((event, emit) async {
      emit(state.copyWith(
        getRecentRoundStatus: GetRecentRoundStatus.loading,
        getRecentNumberStatus: GetRecentNumberStatus.loading,
      ));

      try {
        final recentRound = await service.fetchHtmlLotto();
        if (recentRound != null) {
          emit(state.copyWith(
            recentRound: recentRound.toString(),
            getRecentRoundStatus: GetRecentRoundStatus.success,
          ));
        }
        final recentNumber = await service.getRecentLottoNumber(
            recentRound: recentRound.toString());

        emit(state.copyWith(
          num1: recentNumber['drwtNo1'].toString(),
          num2: recentNumber['drwtNo2'].toString(),
          num3: recentNumber['drwtNo3'].toString(),
          num4: recentNumber['drwtNo4'].toString(),
          num5: recentNumber['drwtNo5'].toString(),
          num6: recentNumber['drwtNo6'].toString(),
          bonus: recentNumber['bnusNo'].toString(),
          getRecentNumberStatus: GetRecentNumberStatus.success,
          firstWinamnt: recentNumber['firstWinamnt'].toString(),
        ));
      } catch (e) {
        emit(state.copyWith(
          getRecentRoundStatus: GetRecentRoundStatus.failure,
          getRecentNumberStatus: GetRecentNumberStatus.failure,
        ));

        print('GetRecentRound : $e');
      }
    });

    on<GetLottoNumber>(
      (event, emit) async {
        try {
          emit(state.copyWith(count: event.count));
          await service.getLottoData(
            recentRound: event.recentRound,
            count: event.count,
            type: event.type,
          );
        } catch (e) {
          print('GetLottoNumber : $e');
        }
      },
    );
  }
}

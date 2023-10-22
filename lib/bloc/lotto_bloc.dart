import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lotto_web/service/lotto_api_service.dart';

part 'lotto_event.dart';
part 'lotto_state.dart';

class LottoBloc extends Bloc<LottoEvent, LottoState> {
  LottoBloc() : super(const LottoInitial()) {
    final service = LottoApiService();

    on<GetRecentRound>((event, emit) async {
      emit(state.copyWith(getRecentRoundStatus: GetRecentRoundStatus.loading));

      try {
        final recentRound = await service.fetchHtmlLotto();
        if (recentRound != null) {
          emit(state.copyWith(
            recentRound: recentRound.toString(),
            getRecentRoundStatus: GetRecentRoundStatus.success,
          ));
        }
      } catch (e) {
        emit(
            state.copyWith(getRecentRoundStatus: GetRecentRoundStatus.failure));

        print('GetRecentRound : $e');
      }
    });

    on<GetLottoNumber>(
      (event, emit) async {
        try {
          await service.getLottoData(recentRound: event.recentRound);
        } catch (e) {
          print('GetLottoNumber : $e');
        }
      },
    );
  }
}

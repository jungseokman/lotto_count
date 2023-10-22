import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_web/bloc/lotto_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<LottoBloc>().add(GetRecentRound());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LottoBloc, LottoState>(
      listener: (context, state) {
        if (state.getRecentRoundStatus == GetRecentRoundStatus.success) {
          print(state.recentRound);
          context
              .read<LottoBloc>()
              .add(GetLottoNumber(recentRound: state.recentRound.toString()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Container(
                width: 375,
                color: Colors.amber,
                child: const Column(
                  children: [],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

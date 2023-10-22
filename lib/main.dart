import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_web/bloc/lotto_bloc.dart';
import 'package:lotto_web/common/routers.dart';

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LottoBloc(),
          )
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: routers,
        ));
  }
}

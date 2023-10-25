import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lotto_web/bloc/lotto_bloc.dart';
import 'package:lotto_web/service/lotto_api_service.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  final lottoService = LottoApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<int>(
          stream: lottoService.progressStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              int progressData = snapshot.data!;
              int progressRate =
                  ((progressData / context.read<LottoBloc>().state.count) * 100)
                      .round();

              if (progressRate == 100) {
                Future.delayed(Duration.zero, () {
                  context.push('/lotto');
                });
              }
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(11),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: (progressRate / 100) * 300,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: const Radius.circular(10),
                                topLeft: const Radius.circular(10),
                                bottomRight: progressRate == 100
                                    ? const Radius.circular(10)
                                    : const Radius.circular(00),
                                topRight: progressRate == 100
                                    ? const Radius.circular(10)
                                    : const Radius.circular(00),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '번호 추출중입니다... ($progressRate%)',
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ));
            } else {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(11),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 0,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          '번호 추출중입니다... (0%)',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ));
            }
          },
        ),
      ),
    );
  }
}

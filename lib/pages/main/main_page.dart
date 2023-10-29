import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lotto_web/bloc/lotto_bloc.dart';
import 'dart:html' as html;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController countEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<LottoBloc>().add(GetRecentRound());
  }

  @override
  void dispose() {
    countEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 375,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'LOTTO 번호 추출기',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: Column(
                      children: [
                        Text(
                          '최근 회차로부터 가져올 데이터양',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue[800],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 300,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.deepPurple),
                          ),
                          child: TextField(
                            textAlign: TextAlign.right,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                            controller: countEditingController,
                            cursorColor: Colors.deepPurple,
                            decoration: const InputDecoration(
                              suffix: Padding(
                                padding: EdgeInsets.only(right: 15.0),
                                child: Text(' 개'),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: '가져올 데이터양을 입력해주세요',
                              hintStyle: TextStyle(),
                            ),
                            style: const TextStyle(),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '최대 500개 이하의 추출을 권장합니다.',
                          style: TextStyle(
                              fontSize: 12, color: Colors.blueGrey[400]),
                        ),
                        Text(
                          '가져오는 데이터양이 클수록 번호추출시간이 증가됩니다.',
                          style: TextStyle(
                              fontSize: 12, color: Colors.blueGrey[400]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  countEditingController.text = '10';
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '10회',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  countEditingController.text = '20';
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '20회',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  countEditingController.text = '30';
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '30회',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  countEditingController.text = '50';
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '50회',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  countEditingController.text = '100';
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '100회',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  countEditingController.text = '200';
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '200회',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(color: Colors.grey),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                html.window.open(
                                    'https://cors-anywhere.herokuapp.com',
                                    'new tab');
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  '아래 버튼 무한 로딩시 클릭해서 CORS 오류 해결',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                context
                                            .watch<LottoBloc>()
                                            .state
                                            .getRecentRoundStatus ==
                                        GetRecentRoundStatus.success
                                    ? GestureDetector(
                                        onTap: () {
                                          if (countEditingController
                                                  .text.isEmpty ||
                                              countEditingController.text ==
                                                  '0') {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Center(
                                                  child: SizedBox(
                                                    height: 150,
                                                    child: AlertDialog(
                                                      content: const Center(
                                                          child: Text(
                                                              '가져올 데이터양을 입력해주세요')),
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      actions: [
                                                        ElevatedButton(
                                                            style: const ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStatePropertyAll(
                                                                        Colors
                                                                            .indigo)),
                                                            onPressed: () {
                                                              context.pop();
                                                            },
                                                            child: const Text(
                                                                '확인'))
                                                      ],
                                                      actionsAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            context.read<LottoBloc>().add(
                                                  GetLottoNumber(
                                                    recentRound: context
                                                        .read<LottoBloc>()
                                                        .state
                                                        .recentRound
                                                        .toString(),
                                                    count: int.parse(
                                                        countEditingController
                                                            .text),
                                                    type: 'many',
                                                  ),
                                                );

                                            context.push('/progress');
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.indigo,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            '많이 나온 번호중에서 로또 번호 생성',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child: LoadingAnimationWidget
                                            .threeRotatingDots(
                                          color: Colors.indigo,
                                          size: 40,
                                        ),
                                      ),
                                const SizedBox(
                                  height: 10,
                                ),
                                context
                                            .watch<LottoBloc>()
                                            .state
                                            .getRecentRoundStatus ==
                                        GetRecentRoundStatus.success
                                    ? GestureDetector(
                                        onTap: () {
                                          if (countEditingController
                                                  .text.isEmpty ||
                                              countEditingController.text ==
                                                  '0') {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Center(
                                                  child: SizedBox(
                                                    height: 150,
                                                    child: AlertDialog(
                                                      content: const Center(
                                                          child: Text(
                                                              '가져올 데이터양을 입력해주세요')),
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      actions: [
                                                        ElevatedButton(
                                                            style: const ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStatePropertyAll(
                                                                        Colors
                                                                            .indigo)),
                                                            onPressed: () {
                                                              context.pop();
                                                            },
                                                            child: const Text(
                                                                '확인'))
                                                      ],
                                                      actionsAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            context.read<LottoBloc>().add(
                                                  GetLottoNumber(
                                                    recentRound: context
                                                        .read<LottoBloc>()
                                                        .state
                                                        .recentRound
                                                        .toString(),
                                                    count: int.parse(
                                                        countEditingController
                                                            .text),
                                                    type: 'low',
                                                  ),
                                                );

                                            context.push('/progress');
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.teal,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            '적게 나온 번호중에서 로또 번호 생성',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child: LoadingAnimationWidget
                                            .threeRotatingDots(
                                          color: Colors.teal,
                                          size: 40,
                                        ),
                                      ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(color: Colors.grey),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<LottoBloc>().add(
                                  GetLottoNumber(
                                    recentRound: context
                                        .read<LottoBloc>()
                                        .state
                                        .recentRound
                                        .toString(),
                                    count: 0,
                                    type: 'random',
                                  ),
                                );

                            context.push('/lotto');
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              '무작위 로또 번호 생성',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(color: Colors.grey),
                        const SizedBox(
                          height: 10,
                        ),
                        (context
                                        .watch<LottoBloc>()
                                        .state
                                        .getRecentNumberStatus ==
                                    GetRecentNumberStatus.success &&
                                context
                                        .watch<LottoBloc>()
                                        .state
                                        .getRecentRoundStatus ==
                                    GetRecentRoundStatus.success)
                            ? GestureDetector(
                                onTap: () {
                                  context.push(
                                      '/result/${context.read<LottoBloc>().state.recentRound.toString()}');
                                },
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '내 로또 번호 맞춰보기',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            : Center(
                                child: LoadingAnimationWidget.threeRotatingDots(
                                  color: Colors.amber,
                                  size: 40,
                                ),
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

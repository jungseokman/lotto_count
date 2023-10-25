import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lotto_web/bloc/lotto_bloc.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    super.key,
    required this.recent,
  });

  final String recent;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late final TextEditingController recentEditingController =
      TextEditingController(text: widget.recent);
  final TextEditingController num1EditingController = TextEditingController();
  final TextEditingController num2EditingController = TextEditingController();
  final TextEditingController num3EditingController = TextEditingController();
  final TextEditingController num4EditingController = TextEditingController();
  final TextEditingController num5EditingController = TextEditingController();
  final TextEditingController num6EditingController = TextEditingController();

  //!
  final TextEditingController num11EditingController = TextEditingController();
  final TextEditingController num12EditingController = TextEditingController();
  final TextEditingController num13EditingController = TextEditingController();
  final TextEditingController num14EditingController = TextEditingController();
  final TextEditingController num15EditingController = TextEditingController();
  final TextEditingController num16EditingController = TextEditingController();
  //!
  final TextEditingController num21EditingController = TextEditingController();
  final TextEditingController num22EditingController = TextEditingController();
  final TextEditingController num23EditingController = TextEditingController();
  final TextEditingController num24EditingController = TextEditingController();
  final TextEditingController num25EditingController = TextEditingController();
  final TextEditingController num26EditingController = TextEditingController();
  //!
  final TextEditingController num31EditingController = TextEditingController();
  final TextEditingController num32EditingController = TextEditingController();
  final TextEditingController num33EditingController = TextEditingController();
  final TextEditingController num34EditingController = TextEditingController();
  final TextEditingController num35EditingController = TextEditingController();
  final TextEditingController num36EditingController = TextEditingController();
  //!
  final TextEditingController num41EditingController = TextEditingController();
  final TextEditingController num42EditingController = TextEditingController();
  final TextEditingController num43EditingController = TextEditingController();
  final TextEditingController num44EditingController = TextEditingController();
  final TextEditingController num45EditingController = TextEditingController();
  final TextEditingController num46EditingController = TextEditingController();

  final List<String> resultList = [];
  final List<String> bonusList = [];
  List<String> resultBonusList = [];
  final List<String> numberRowData1 = [];
  final List<String> numberRowData2 = [];
  final List<String> numberRowData3 = [];
  final List<String> numberRowData4 = [];
  final List<String> numberRowData5 = [];

  bool myLottoInput = false;

  @override
  void initState() {
    super.initState();
    resultList.add(context.read<LottoBloc>().state.num1);
    resultList.add(context.read<LottoBloc>().state.num2);
    resultList.add(context.read<LottoBloc>().state.num3);
    resultList.add(context.read<LottoBloc>().state.num4);
    resultList.add(context.read<LottoBloc>().state.num5);
    resultList.add(context.read<LottoBloc>().state.num6);
    bonusList.add(context.read<LottoBloc>().state.bonus);
    resultBonusList = [...resultList, context.read<LottoBloc>().state.bonus];
    print(resultBonusList);
  }

  Color ballColorHandler({required int number}) {
    if (number <= 10) {
      return Colors.yellow.shade600;
    } else if (10 < number && number <= 20) {
      return Colors.blue;
    } else if (20 < number && number <= 30) {
      return Colors.orange;
    } else if (30 < number && number <= 40) {
      return Colors.grey;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    final commaFirstWinamnt = NumberFormat('#,###', 'ko_KR')
        .format(int.parse(context.read<LottoBloc>().state.firstWinamnt));

    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  '${widget.recent}회 당첨 결과',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue[800],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(resultBonusList.length, (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: index == 6
                              ? const EdgeInsets.only(left: 10)
                              : const EdgeInsets.only(right: 10),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ballColorHandler(
                                number: int.parse(resultBonusList[index])),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            resultBonusList[index].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (index == 5) const Icon(Icons.add)
                      ],
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '1등 당첨금 : $commaFirstWinamnt원',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            // Text(
            //   '조회할 로또 당첨결과 회차',
            //   style: TextStyle(
            //     fontSize: 16,
            //     color: Colors.blue[800],
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   width: 300,
            //   height: 40,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(5),
            //     border: Border.all(color: Colors.deepPurple),
            //   ),
            //   child: TextField(
            //     textAlign: TextAlign.right,
            //     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            //     keyboardType: TextInputType.number,
            //     controller: recentEditingController,
            //     cursorColor: Colors.deepPurple,
            //     decoration: const InputDecoration(
            //       suffix: Padding(
            //         padding: EdgeInsets.only(right: 20.0),
            //         child: Text(' 회'),
            //       ),
            //       contentPadding:
            //           EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            //       border: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //       ),
            //       hintText: '당첨결과 회차를 입력해주세요',
            //       hintStyle: TextStyle(),
            //     ),
            //     style: const TextStyle(),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            Text(
              '내 로또 번호 입력',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue[800],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MyLottoNumberList(
                numText: '1',
                num1EditingController: num1EditingController,
                num2EditingController: num2EditingController,
                num3EditingController: num3EditingController,
                num4EditingController: num4EditingController,
                num5EditingController: num5EditingController,
                num6EditingController: num6EditingController),
            const SizedBox(
              height: 10,
            ),
            MyLottoNumberList(
                numText: '2',
                num1EditingController: num11EditingController,
                num2EditingController: num12EditingController,
                num3EditingController: num13EditingController,
                num4EditingController: num14EditingController,
                num5EditingController: num15EditingController,
                num6EditingController: num16EditingController),
            const SizedBox(
              height: 10,
            ),
            MyLottoNumberList(
                numText: '3',
                num1EditingController: num21EditingController,
                num2EditingController: num22EditingController,
                num3EditingController: num23EditingController,
                num4EditingController: num24EditingController,
                num5EditingController: num25EditingController,
                num6EditingController: num26EditingController),
            const SizedBox(
              height: 10,
            ),
            MyLottoNumberList(
                numText: '4',
                num1EditingController: num31EditingController,
                num2EditingController: num32EditingController,
                num3EditingController: num33EditingController,
                num4EditingController: num34EditingController,
                num5EditingController: num35EditingController,
                num6EditingController: num36EditingController),
            const SizedBox(
              height: 10,
            ),
            MyLottoNumberList(
                numText: '5',
                num1EditingController: num41EditingController,
                num2EditingController: num42EditingController,
                num3EditingController: num43EditingController,
                num4EditingController: num44EditingController,
                num5EditingController: num45EditingController,
                num6EditingController: num46EditingController),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                if (myLottoInput) {
                  context.push(
                      '/result/${context.read<LottoBloc>().state.recentRound.toString()}');
                } else {
                  if (num1EditingController.text.isNotEmpty &&
                      num2EditingController.text.isNotEmpty &&
                      num3EditingController.text.isNotEmpty &&
                      num4EditingController.text.isNotEmpty &&
                      num5EditingController.text.isNotEmpty &&
                      num6EditingController.text.isNotEmpty &&
                      num11EditingController.text.isNotEmpty &&
                      num12EditingController.text.isNotEmpty &&
                      num13EditingController.text.isNotEmpty &&
                      num14EditingController.text.isNotEmpty &&
                      num15EditingController.text.isNotEmpty &&
                      num16EditingController.text.isNotEmpty &&
                      num21EditingController.text.isNotEmpty &&
                      num22EditingController.text.isNotEmpty &&
                      num23EditingController.text.isNotEmpty &&
                      num24EditingController.text.isNotEmpty &&
                      num25EditingController.text.isNotEmpty &&
                      num26EditingController.text.isNotEmpty &&
                      num31EditingController.text.isNotEmpty &&
                      num32EditingController.text.isNotEmpty &&
                      num33EditingController.text.isNotEmpty &&
                      num34EditingController.text.isNotEmpty &&
                      num35EditingController.text.isNotEmpty &&
                      num36EditingController.text.isNotEmpty &&
                      num41EditingController.text.isNotEmpty &&
                      num42EditingController.text.isNotEmpty &&
                      num43EditingController.text.isNotEmpty &&
                      num44EditingController.text.isNotEmpty &&
                      num45EditingController.text.isNotEmpty &&
                      num46EditingController.text.isNotEmpty) {
                    numberRowData1.add(num1EditingController.text);
                    numberRowData1.add(num2EditingController.text);
                    numberRowData1.add(num3EditingController.text);
                    numberRowData1.add(num4EditingController.text);
                    numberRowData1.add(num5EditingController.text);
                    numberRowData1.add(num6EditingController.text);

                    numberRowData2.add(num11EditingController.text);
                    numberRowData2.add(num12EditingController.text);
                    numberRowData2.add(num13EditingController.text);
                    numberRowData2.add(num14EditingController.text);
                    numberRowData2.add(num15EditingController.text);
                    numberRowData2.add(num16EditingController.text);

                    numberRowData3.add(num21EditingController.text);
                    numberRowData3.add(num22EditingController.text);
                    numberRowData3.add(num23EditingController.text);
                    numberRowData3.add(num24EditingController.text);
                    numberRowData3.add(num25EditingController.text);
                    numberRowData3.add(num26EditingController.text);

                    numberRowData4.add(num31EditingController.text);
                    numberRowData4.add(num32EditingController.text);
                    numberRowData4.add(num33EditingController.text);
                    numberRowData4.add(num34EditingController.text);
                    numberRowData4.add(num35EditingController.text);
                    numberRowData4.add(num36EditingController.text);

                    numberRowData5.add(num41EditingController.text);
                    numberRowData5.add(num42EditingController.text);
                    numberRowData5.add(num43EditingController.text);
                    numberRowData5.add(num44EditingController.text);
                    numberRowData5.add(num45EditingController.text);
                    numberRowData5.add(num46EditingController.text);

                    setState(() {
                      myLottoInput = true;
                    });
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: SizedBox(
                            height: 130,
                            child: AlertDialog(
                              content:
                                  const Center(child: Text('로또 번호를 입력해주세요')),
                              contentPadding: const EdgeInsets.all(0),
                              actions: [
                                ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.indigo)),
                                    onPressed: () {
                                      context.pop();
                                    },
                                    child: const Text('확인'))
                              ],
                              actionsAlignment: MainAxisAlignment.center,
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
              },
              child: Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  color: myLottoInput ? Colors.brown : Colors.pink,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Text(
                  myLottoInput ? '다른 로또로 당첨결과 비교' : '내 로또와 당첨결과 비교',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                context.go('/');
              },
              child: Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: const Text(
                  '이전으로 돌아가기',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            if (myLottoInput)
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 230,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 5),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5.0,
                          blurRadius: 7.0,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //! 1

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                              List.generate(numberRowData1.length, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: index == 5
                                      ? const EdgeInsets.only(left: 0)
                                      : const EdgeInsets.only(right: 10),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: ballColorHandler(
                                      number: int.parse(numberRowData1[index]),
                                    ),
                                    border: Border.all(
                                      color: resultList
                                              .contains(numberRowData1[index])
                                          ? Colors.red
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Text(
                                          numberRowData1[index].toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      if (!resultList.contains(
                                              numberRowData1[index]) &&
                                          !bonusList
                                              .contains(numberRowData1[index]))
                                        const Center(
                                          child: Icon(
                                            Icons.close,
                                            size: 28,
                                            color: Colors.black,
                                          ),
                                        ),
                                      if (bonusList
                                          .contains(numberRowData1[index]))
                                        const Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            'bonus',
                                            style: TextStyle(
                                              fontSize: 8,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        //! 2
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                              List.generate(numberRowData2.length, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: index == 5
                                      ? const EdgeInsets.only(left: 0)
                                      : const EdgeInsets.only(right: 10),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: ballColorHandler(
                                      number: int.parse(numberRowData2[index]),
                                    ),
                                    border: Border.all(
                                      color: resultList
                                              .contains(numberRowData2[index])
                                          ? Colors.red
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Text(
                                          numberRowData2[index].toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      if (!resultList.contains(
                                              numberRowData2[index]) &&
                                          !bonusList
                                              .contains(numberRowData2[index]))
                                        const Center(
                                          child: Icon(
                                            Icons.close,
                                            size: 28,
                                            color: Colors.black,
                                          ),
                                        ),
                                      if (bonusList
                                          .contains(numberRowData2[index]))
                                        const Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            'bonus',
                                            style: TextStyle(
                                              fontSize: 8,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        //! 3
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                              List.generate(numberRowData3.length, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: index == 5
                                      ? const EdgeInsets.only(left: 0)
                                      : const EdgeInsets.only(right: 10),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: ballColorHandler(
                                      number: int.parse(numberRowData3[index]),
                                    ),
                                    border: Border.all(
                                      color: resultList
                                              .contains(numberRowData3[index])
                                          ? Colors.red
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Text(
                                          numberRowData3[index].toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      if (!resultList.contains(
                                              numberRowData3[index]) &&
                                          !bonusList
                                              .contains(numberRowData3[index]))
                                        const Center(
                                          child: Icon(
                                            Icons.close,
                                            size: 28,
                                            color: Colors.black,
                                          ),
                                        ),
                                      if (bonusList
                                          .contains(numberRowData3[index]))
                                        const Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            'bonus',
                                            style: TextStyle(
                                              fontSize: 8,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        //! 4
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                              List.generate(numberRowData4.length, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: index == 5
                                      ? const EdgeInsets.only(left: 0)
                                      : const EdgeInsets.only(right: 10),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: ballColorHandler(
                                      number: int.parse(numberRowData4[index]),
                                    ),
                                    border: Border.all(
                                      color: resultList
                                              .contains(numberRowData4[index])
                                          ? Colors.red
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Text(
                                          numberRowData4[index].toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      if (!resultList.contains(
                                              numberRowData4[index]) &&
                                          !bonusList
                                              .contains(numberRowData4[index]))
                                        const Center(
                                          child: Icon(
                                            Icons.close,
                                            size: 28,
                                            color: Colors.black,
                                          ),
                                        ),
                                      if (bonusList
                                          .contains(numberRowData4[index]))
                                        const Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            'bonus',
                                            style: TextStyle(
                                              fontSize: 8,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        //! 5
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                              List.generate(numberRowData5.length, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: index == 5
                                      ? const EdgeInsets.only(left: 0)
                                      : const EdgeInsets.only(right: 10),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: ballColorHandler(
                                      number: int.parse(numberRowData5[index]),
                                    ),
                                    border: Border.all(
                                      color: resultList
                                              .contains(numberRowData5[index])
                                          ? Colors.red
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Text(
                                          numberRowData5[index].toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      if (!resultList.contains(
                                              numberRowData5[index]) &&
                                          !bonusList
                                              .contains(numberRowData5[index]))
                                        const Center(
                                          child: Icon(
                                            Icons.close,
                                            size: 28,
                                            color: Colors.black,
                                          ),
                                        ),
                                      if (bonusList
                                          .contains(numberRowData5[index]))
                                        const Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            'bonus',
                                            style: TextStyle(
                                              fontSize: 8,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        )),
      ),
    );
  }
}

class MyLottoNumberList extends StatelessWidget {
  const MyLottoNumberList({
    super.key,
    required this.num1EditingController,
    required this.num2EditingController,
    required this.num3EditingController,
    required this.num4EditingController,
    required this.num5EditingController,
    required this.num6EditingController,
    required this.numText,
  });

  final TextEditingController num1EditingController;
  final TextEditingController num2EditingController;
  final TextEditingController num3EditingController;
  final TextEditingController num4EditingController;
  final TextEditingController num5EditingController;
  final TextEditingController num6EditingController;
  final String numText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.deepPurple,
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              numText,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          MyLottoNumber(recentEditingController: num1EditingController),
          const SizedBox(
            width: 10,
          ),
          MyLottoNumber(recentEditingController: num2EditingController),
          const SizedBox(
            width: 10,
          ),
          MyLottoNumber(recentEditingController: num3EditingController),
          const SizedBox(
            width: 10,
          ),
          MyLottoNumber(recentEditingController: num4EditingController),
          const SizedBox(
            width: 10,
          ),
          MyLottoNumber(recentEditingController: num5EditingController),
          const SizedBox(
            width: 10,
          ),
          MyLottoNumber(recentEditingController: num6EditingController),
        ],
      ),
    );
  }
}

class MyLottoNumber extends StatelessWidget {
  const MyLottoNumber({
    super.key,
    required this.recentEditingController,
  });

  final TextEditingController recentEditingController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.deepPurple),
        ),
        child: TextField(
          textAlign: TextAlign.center,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          maxLength: 2,
          keyboardType: TextInputType.number,
          controller: recentEditingController,
          cursorColor: Colors.deepPurple,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            counterText: '',
          ),
          style: const TextStyle(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lotto_web/service/lotto_api_service.dart';

class LottoPage extends StatefulWidget {
  const LottoPage({super.key});

  @override
  State<LottoPage> createState() => _LottoPageState();
}

class _LottoPageState extends State<LottoPage> {
  final lottoService = LottoApiService();

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
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<Map<int, List<int>>>(
          stream: lottoService.selectedNumbersStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('No Data Available.');
            } else {
              List<int>? numberRowData1 = snapshot.data![1];
              List<int>? numberRowData2 = snapshot.data![2];
              List<int>? numberRowData3 = snapshot.data![3];
              List<int>? numberRowData4 = snapshot.data![4];
              List<int>? numberRowData5 = snapshot.data![5];
              List<int>? numberRowData6 = snapshot.data![6];
              List<int>? numberRowData7 = snapshot.data![7];
              List<int>? numberRowData8 = snapshot.data![8];
              List<int>? numberRowData9 = snapshot.data![9];
              List<int>? numberRowData10 = snapshot.data![10];

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 230,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.shade300, width: 5),
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
                                List.generate(numberRowData1!.length, (index) {
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
                                          number: numberRowData1[index]),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      numberRowData1[index].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                List.generate(numberRowData2!.length, (index) {
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
                                          number: numberRowData2[index]),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      numberRowData2[index].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                List.generate(numberRowData3!.length, (index) {
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
                                          number: numberRowData3[index]),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      numberRowData3[index].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                List.generate(numberRowData4!.length, (index) {
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
                                          number: numberRowData4[index]),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      numberRowData4[index].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                List.generate(numberRowData5!.length, (index) {
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
                                          number: numberRowData5[index]),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      numberRowData5[index].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 300,
                      height: 230,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.shade300, width: 5),
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
                          //! 6
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:
                                List.generate(numberRowData6!.length, (index) {
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
                                          number: numberRowData6[index]),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      numberRowData6[index].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          //! 7
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:
                                List.generate(numberRowData7!.length, (index) {
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
                                          number: numberRowData7[index]),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      numberRowData7[index].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          //! 8
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:
                                List.generate(numberRowData8!.length, (index) {
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
                                          number: numberRowData8[index]),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      numberRowData8[index].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          //! 9
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:
                                List.generate(numberRowData9!.length, (index) {
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
                                          number: numberRowData9[index]),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      numberRowData9[index].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          //! 10
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:
                                List.generate(numberRowData10!.length, (index) {
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
                                          number: numberRowData10[index]),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      numberRowData10[index].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go('/');
                      },
                      child: Container(
                        width: 300,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          '이전으로 돌아가기',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

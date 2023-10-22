import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:html/parser.dart';

class LottoApiService {
  final _dio = Dio();
  final cors = 'https://cors.bridged.cc';

  Future<dynamic> fetchHtmlLotto() async {
    try {
      final response = await _dio.get(
        '$cors/https://www.dhlottery.co.kr/gameResult.do?method=byWin',
        options: Options(
          headers: {'x-cors-api-key': 'temp_fc67a83740ef24e8c66916051c9ac23e'},
        ),
      );

      final html = response.data;

      var document = parse(html);
      var element = document.querySelector('div.win_result > h4 > strong');

      if (element != null) {
        var match = RegExp(r'(\d+)').firstMatch(element.text);
        if (match != null) {
          return int.parse(match.group(1)!);
        } else {
          print('Number not found in the text');
        }
      } else {
        print('Element not found');
      }

      // if(response.)
    } catch (e) {
      print('Error fetching HTML: $e');
    }
  }

  Future<dynamic> getLottoData({required String recentRound}) async {
    List<int> numberList = [];
    int progress = 0;
    Map<int, int> numberCount = {};
    List<int> popularNumberList = [];
    Map<int, List<int>> selectedNumbers = {};

    for (int i = 1; i <= 45; i++) {
      numberCount[i] = 0;
    }

    try {
      //! 최근 회차부터 주어진 갯수 만큼의 로또 번호 추출
      for (var i = 0; i < 20; i++) {
        int no = int.parse(recentRound) - i;

        final response = await _dio.get(
          '$cors/https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=$no',
          options: Options(
            headers: {
              'x-cors-api-key': 'temp_fc67a83740ef24e8c66916051c9ac23e'
            },
          ),
        );
        if (response.data != null) {
          Map<String, dynamic> jsonData = json.decode(response.data);

          numberList.add(jsonData['drwtNo1']);
          numberList.add(jsonData['drwtNo2']);
          numberList.add(jsonData['drwtNo3']);
          numberList.add(jsonData['drwtNo4']);
          numberList.add(jsonData['drwtNo5']);
          numberList.add(jsonData['drwtNo6']);
          numberList.add(jsonData['bnusNo']);

          //! 오래걸려서 얼마나 진행됐는지 파악하기 위해 만듬
          progress++;
          print(progress);
        }
      }

      //! 로또 번호 리스트를 각 번호 별 갯수 정리
      for (int number in numberList) {
        if (numberCount.containsKey(number)) {
          numberCount[number] = numberCount[number]! + 1;
        }
      }

      //! 일정한 횟수 이상 나온 로또 번호를 추출
      for (var entry in numberCount.entries) {
        if (entry.value >= 3) {
          popularNumberList.add(entry.key);
        }
      }

      //! 추출한 로또번호에서 랜덤으로 6개의 번호와 보너스 번호를 추출 (5번 반복)
      for (var i = 0; i < 5; i++) {
        popularNumberList.shuffle(Random());
        selectedNumbers[i + 1] = popularNumberList.take(7).toList();
      }
    } catch (e) {
      print(e);
    }

    print(popularNumberList);
    print(selectedNumbers);
  }
}

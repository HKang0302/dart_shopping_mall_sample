import 'dart:io';

import 'package:mall/product.dart';

class Admin {
  late bool isAdmin;
  bool exit = false;

  void startAdmin() {
    isAdmin = true;
    print('관리자모드에 진입했습니다.');

    while (!exit) {
      print(
        '---------------------------------------------------------------------------------------',
      );
      print(
        '[1] 상품 추가 / [2] 상품 삭제 / [3] 상품 목록 보기 / [4] 기본 상품 목록으로 초기화 \n[0] 관리자모드 종료',
      );
      print(
        '---------------------------------------------------------------------------------------',
      );
      String input = stdin.readLineSync() ?? '';
      switch (input) {
        case '1':
          try {
            String? name;
            int? price;
            int? quantity;

            print('추가할 상품의 이름을 입력해주세요.');
            while (name == null || name.isEmpty) {
              name = stdin.readLineSync();
              if (name == null || name.isEmpty) {
                print('상품 이름을 다시 입력해주세요.');
              }
            }

            print('추가할 상품의 가격을 입력해주세요.');
            while (price == null) {
              String? tmpPrice = stdin.readLineSync();
              price = int.tryParse(tmpPrice ?? '');
              if (price == null) {
                print('상품 가격을 다시 입력해주세요.');
              }
            }

            print('추가할 상품의 수량을 입력해주세요.');
            while (quantity == null) {
              String? tmpQuantity = stdin.readLineSync();
              quantity = int.tryParse(tmpQuantity ?? '');
              if (quantity == null) {
                print('상품 수량을 다시 입력해주세요.');
              }
            }

            Products().addProduct(name, price, quantity);
          } catch (e) {
            print(e.toString());
          }
          break;
        case '2':
          print('삭제할 상품의 이름을 입력해주세요.');
          String? name;
          while (name == null || name.isEmpty) {
            name = stdin.readLineSync();
            if (name == null || name.isEmpty) {
              print('상품 이름을 다시 입력해주세요.');
            }
          }
          Products().removeProduct(name);
          break;
        case '3':
          Products().showProducts();
          break;
        case '4':
          Products().getDefaultProducts();
          break;
        case '0':
          exit = true;
          break;
        default:
          print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
      }
    }
    print('관리자모드를 종료합니다.');
  }
}

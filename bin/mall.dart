import 'dart:io';

import 'package:mall/admin.dart';
import 'package:mall/shopping_mall.dart';

void main(List<String> arguments) {
  final String PASSWORD = '1234';

  ShoppingMall myMall = ShoppingMall();
  bool exit = false;

  while (!exit) {
    print(
      '---------------------------------------------------------------------------------------',
    );
    print(
      '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기\n[4] 프로그램 종료 / [0] 관리자 모드',
    );
    print(
      '---------------------------------------------------------------------------------------',
    );
    String input = stdin.readLineSync() ?? '';
    switch (input) {
      case '1':
        myMall.showProducts();
        break;
      case '2':
        myMall.addToCart();
        break;
      case '3':
        myMall.showTotal();
        break;
      case '4':
        print('정말 종료하시겠습니까? (5: 예 / 6: 아니요)');
        if (stdin.readLineSync() == '5') {
          exit = true;
        } else {
          print('종료하지 않습니다.');
        }
        break;
      case '6':
        myMall.initCart();
        break;
      case '0':
        print('비밀번호를 입력해주세요.');
        String password = stdin.readLineSync() ?? '';
        if (password == PASSWORD) {
          Admin admin = Admin();
          admin.startAdmin();
        } else {
          print('비밀번호가 틀렸습니다.');
        }
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
  }
  print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
}

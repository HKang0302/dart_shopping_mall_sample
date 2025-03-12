import 'dart:io';

import 'package:mall/admin.dart';
import 'package:mall/user.dart';

void main(List<String> arguments) {
  final String ADMIN_PASSWORD = '1234';
  bool exit = false;

  while (!exit) {
    print("[1] 회원가입 / [2] 로그인 / [3] 관리자 로그인 / [0] 종료");
    String input = stdin.readLineSync() ?? '';
    switch (input) {
      // 회원가입
      case '1':
        print('ID를 입력해주세요.');
        String id = stdin.readLineSync() ?? '';
        if (Users.findUser(id) != null) {
          print('이미 존재하는 ID입니다.');
          break;
        }
        print('비밀번호를 입력해주세요.');
        String password = stdin.readLineSync() ?? '';
        Users.addUser(id, password);
        print('회원가입이 완료되었습니다.');
        break;

      // 로그인
      case '2':
        print('ID를 입력해주세요.');
        String id = stdin.readLineSync() ?? '';
        User? user = Users.findUser(id);
        if (user == null) {
          print('존재하지 않는 ID입니다.');
          break;
        }
        print('비밀번호를 입력해주세요.');
        String password = stdin.readLineSync() ?? '';
        if (user.password != password) {
          print('비밀번호가 틀렸습니다.');
          break;
        }
        user.myMall.start();
        break;

      // 관리자 로그인
      case '3':
        print('관리자 비밀번호를 입력해주세요.');
        String password = stdin.readLineSync() ?? '';
        if (password != ADMIN_PASSWORD) {
          print('비밀번호가 틀렸습니다.');
          break;
        }
        Admin().startAdmin();
        break;

      // 종료
      case '0':
        exit = true;
        break;

      // 지원하지 않는 기능
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
  }
  print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
}

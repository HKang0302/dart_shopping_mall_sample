import 'package:mall/my_mall.dart';

/* 사용자 정보를 관리하는 클래스입니다. */
class Users {
  static List<User> users = [User('test', 'test')]; // 기본 유저

  /* 사용자를 추가하는 함수입니다. */
  static void addUser(String id, String password) {
    users.add(User(id, password));
  }

  /* 사용자를 찾는 함수입니다. */
  static User? findUser(String id) {
    for (User user in users) {
      if (user.id == id) {
        return user;
      }
    }
    return null;
  }

  /* 사용자를 삭제하는 함수입니다. */
  static void deleteUser(String id) {
    users.removeWhere((user) => user.id == id);
  }
}

/* 사용자 클래스입니다. */
class User {
  String id;
  String password;
  late MyMall myMall;

  User(this.id, this.password) {
    myMall = MyMall();
  }
}
